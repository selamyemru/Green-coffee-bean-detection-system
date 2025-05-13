import 'package:coffee_been_detection_system/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:coffee_been_detection_system/screen/LoginScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(SignupScreen());
}

class SignupScreen extends StatelessWidget {
  final ValueNotifier<bool> _dark = ValueNotifier<bool>(true);
  final ValueNotifier<double> _widthFactor = ValueNotifier<double>(1.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => LoginScreen(),
      },
      home: SignupPage(dark: _dark, widthFactor: _widthFactor),
    );
  }
}

class SignupPage extends StatefulWidget {
  final ValueNotifier<bool> dark;
  final ValueNotifier<double> widthFactor;

  const SignupPage({required this.dark, required this.widthFactor});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _signUpWithEmail() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() => _errorMessage = "Passwords don't match");
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Update user display name
      await userCredential.user?.updateDisplayName(
        '${_firstNameController.text.trim()} ${_lastNameController.text.trim()}'
      );

      // Navigate to home screen after successful signup
      // Navigator.pushReplacementNamed(context, '/home');

    } on FirebaseAuthException catch (e) {
      setState(() => _errorMessage = _getErrorMessage(e.code));
    } catch (e) {
      setState(() => _errorMessage = 'An unexpected error occurred');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _signInWithGoogle() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
      
      // Navigate to home screen after successful login
      // Navigator.pushReplacementNamed(context, '/home');

    } on FirebaseAuthException catch (e) {
      setState(() => _errorMessage = _getErrorMessage(e.code));
    } catch (e) {
      setState(() => _errorMessage = 'Failed to sign in with Google');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  String _getErrorMessage(String code) {
    switch (code) {
      case 'weak-password': return 'Password is too weak';
      case 'email-already-in-use': return 'Email already in use';
      case 'invalid-email': return 'Invalid email address';
      default: return 'Login failed. Please try again';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: widget.dark,
      builder: (context, color, child) {
        return ValueListenableBuilder<double>(
          valueListenable: widget.widthFactor,
          builder: (context, factor, child) {
            return Scaffold(
              backgroundColor: widget.dark.value ? Colors.black : Colors.white,
              // appBar: AppBar(
              //   actions: [
              //     Switch(
              //       value: widget.dark.value,
              //       onChanged: (value) => widget.dark.value = value,
              //     ),
              //     DropdownButton<double>(
              //       value: widget.widthFactor.value,
              //       onChanged: (value) => widget.widthFactor.value = value!,
              //       items: [0.5, 0.75, 1.0].map((value) => DropdownMenuItem(
              //         value: value,
              //         child: Text('Size: ${(value * 100).toInt()}%'),
              //       )).toList(),
              //     ),
              //   ],
              // ),
              body: _isLoading 
                ? Center(child: CircularProgressIndicator())
                : LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: Center(
                            child: Container(
                              width: constraints.maxWidth * widget.widthFactor.value,
                              child: Home(
                                firstNameController: _firstNameController,
                                lastNameController: _lastNameController,
                                emailController: _emailController,
                                passwordController: _passwordController,
                                confirmPasswordController: _confirmPasswordController,
                                onSignUp: _signUpWithEmail,
                                onGoogleSignIn: _signInWithGoogle,
                                errorMessage: _errorMessage,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
            );
          },
        );
      },
    );
  }
}

class Home extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final VoidCallback onSignUp;
  final VoidCallback onGoogleSignIn;
  final String? errorMessage;

  const Home({
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.onSignUp,
    required this.onGoogleSignIn,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (errorMessage != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 8),
            child: Text(
              errorMessage!,
              style: TextStyle(color: Colors.red),
            ),
          ),
        ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 393,
            maxWidth: 393,
            minHeight: 852,
            maxHeight: 852,
          ),
          child: Material(
            borderRadius: BorderRadius.circular(45),
            color: Colors.white,
            child: Stack(
              children: [
                // Main content
                Positioned(
                  left: 37,
                  top: 120,
                  right: 37,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Create account', style: TextStyle(
                        color: Color(0xFF1E535F),
                        fontSize: 32,
                        fontFamily: 'Sora',
                      )),
                      SizedBox(height: 16),
                      Text('Sign up to get started!', style: TextStyle(
                        color: Color(0xFF869EA3),
                        fontSize: 16,
                      )),
                      SizedBox(height: 30),

                      // Form fields
                      _buildTextField('First name', controller: firstNameController),
                      SizedBox(height: 24),
                      _buildTextField('Last name', controller: lastNameController),
                      SizedBox(height: 24),
                      _buildTextField('Email address', controller: emailController),
                      SizedBox(height: 24),
                      _buildTextField('Password', isPassword: true, controller: passwordController),
                      SizedBox(height: 24),
                      _buildTextField('Confirm password', isPassword: true, controller: confirmPasswordController),
                      SizedBox(height: 30),

                      // Sign up button
                      SizedBox(
                        width: double.infinity,
                        height: 53,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF537006),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          onPressed: onSignUp,
                          child: Text('Sign up', style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          )),
                        ),
                      ),
                      SizedBox(height: 13),

                      // Google login button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Color(0xFFF0F5F2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          icon: Image.network(
                            "https://www.google.com/images/branding/googleg/1x/googleg_standard_color_128dp.png",
                            width: 23,
                            height: 23,
                          ),
                          label: Text('Log in using Google', style: TextStyle(
                            color: Color(0xFF10405A),
                            fontSize: 16,
                          )),
                          onPressed: onGoogleSignIn,
                        ),
                      ),
                      SizedBox(height: 20),
                      
                      // Already have an account? Login link
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: RichText(
                            text: TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(
                                color: Color(0xFF869EA3),
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Login',
                                  style: TextStyle(
                                    color: Color(0xFF1E535F),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(
    String hintText, {
    bool isPassword = false,
    required TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: isPassword
            ? Icon(Icons.lock_outline, size: 20, color: Color(0xFF869EA3))
            : Icon(Icons.person_outline, size: 20, color: Color(0xFF869EA3)),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(Icons.visibility_outlined, size: 20, color: Color(0xFF869EA3)),
                onPressed: () {}, 
              )
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: controller.text.isNotEmpty ? Color(0x661E535F) : Color.fromARGB(51, 37, 30, 95),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      ),
    );
  }
}