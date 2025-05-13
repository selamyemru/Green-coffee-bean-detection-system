import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:coffee_been_detection_system/firebase_options.dart';
import 'Signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(LoginScreen());
}

class LoginScreen extends StatelessWidget {
  final ValueNotifier<bool> _dark = ValueNotifier<bool>(true);
  final ValueNotifier<double> _widthFactor = ValueNotifier<double>(1.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/signup': (context) => SignupScreen(),
      },
      home: LoginPage(dark: _dark, widthFactor: _widthFactor),
    );
  }
}

class LoginPage extends StatefulWidget {
  final ValueNotifier<bool> dark;
  final ValueNotifier<double> widthFactor;

  const LoginPage({required this.dark, required this.widthFactor});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _obscurePassword = true;
  String? _errorMessage;

  // Enhanced validation methods
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  Future<void> _loginWithEmail() async {
    // Validate form before proceeding
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Navigate to home on success
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
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
      // Navigate to home on success
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
      case 'user-not-found':
      case 'wrong-password':
        return 'Invalid email or password';
      case 'user-disabled':
        return 'This account has been disabled';
      case 'too-many-requests':
        return 'Too many attempts. Try again later';
      case 'invalid-email':
        return 'Please enter a valid email address';
      default:
        return 'Login failed. Please try again';
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
              appBar: AppBar(
                actions: [
                  Switch(
                    value: widget.dark.value,
                    onChanged: (value) => widget.dark.value = value,
                  ),
                  DropdownButton<double>(
                    value: widget.widthFactor.value,
                    onChanged: (value) => widget.widthFactor.value = value!,
                    items: [0.5, 0.75, 1.0]
                        .map((value) => DropdownMenuItem(
                              value: value,
                              child: Text('Size: ${(value * 100).toInt()}%'),
                            ))
                        .toList(),
                  ),
                ],
              ),
              body: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width *
                              widget.widthFactor.value,
                          constraints: BoxConstraints(maxWidth: 393),
                          child: Form(
                            key: _formKey,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(45),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Back button
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 28, top: 60),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: IconButton(
                                        icon: Icon(Icons.arrow_back),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ),
                                  
                                  // Main content
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 37,
                                        top: 60,
                                        right: 37,
                                        bottom: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Error message
                                        if (_errorMessage != null)
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 10),
                                            child: Text(
                                              _errorMessage!,
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        
                                        // Title
                                        Text(
                                          'Welcome back',
                                          style: TextStyle(
                                            color: Color(0xFF1E535F),
                                            fontSize: 32,
                                            fontFamily: 'Sora',
                                            height: 1.2,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'Enter your credential to continue',
                                          style: TextStyle(
                                            color: Color(0xFF869EA3),
                                            fontSize: 16,
                                            fontFamily: 'Sora',
                                          ),
                                        ),
                                        SizedBox(height: 30),
                                        
                                        // Email field
                                        TextFormField(
                                          controller: _emailController,
                                          keyboardType: TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            hintText: 'Email address',
                                            hintStyle: TextStyle(
                                              color: Color(0xFF869EA3),
                                              fontSize: 16,
                                              fontFamily: 'Sora',
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1,
                                                color: Color(0x331E535F),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                    vertical: 15),
                                          ),
                                          validator: _validateEmail,
                                        ),
                                        SizedBox(height: 24),
                                        
                                        // Password field
                                        TextFormField(
                                          controller: _passwordController,
                                          obscureText: _obscurePassword,
                                          decoration: InputDecoration(
                                            hintText: 'Password',
                                            hintStyle: TextStyle(
                                              color: Color(0xFF869EA3),
                                              fontSize: 16,
                                              fontFamily: 'Sora',
                                            ),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1,
                                                color: Color(0x331E535F),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                    vertical: 15),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                _obscurePassword
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                color: Color(0xFF869EA3),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _obscurePassword =
                                                      !_obscurePassword;
                                                });
                                              },
                                            ),
                                          ),
                                          validator: _validatePassword,
                                        ),
                                        SizedBox(height: 8),
                                        
                                        // Forgot password
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: TextButton(
                                            onPressed: () {
                                              // Add forgot password functionality
                                            },
                                            child: Text(
                                              'Forgot password?',
                                              style: TextStyle(
                                                color: Color(0xFF1E535F),
                                                fontSize: 12,
                                                fontFamily: 'Sora',
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 45),
                                        
                                        // Login button
                                        ElevatedButton(
                                          onPressed: _loginWithEmail,
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Color(0xFF537006),
                                            minimumSize:
                                                Size(double.infinity, 53),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                          ),
                                          child: Text(
                                            'Log in',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontFamily: 'Sora',
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 22),
                                        
                                        // Google login button
                                        OutlinedButton(
                                          onPressed: _signInWithGoogle,
                                          style: OutlinedButton.styleFrom(
                                            backgroundColor:
                                                Color(0xFFF0F5F2),
                                            minimumSize:
                                                Size(double.infinity, 50),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.g_mobiledata, size: 24),
                                              SizedBox(width: 10),
                                              Text(
                                                'Log in with Google',
                                                style: TextStyle(
                                                  color: Color(0xFF1E535F),
                                                  fontSize: 16,
                                                  fontFamily: 'Sora',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 25),
                                        
                                        // Sign up link
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Don't have an account?",
                                              style: TextStyle(
                                                  fontFamily: 'Sora'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pushNamed(
                                                    context, '/signup');
                                              },
                                              child: Text(
                                                "Sign up",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF1E535F),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
            );
          },
        );
      },
    );
  }
}