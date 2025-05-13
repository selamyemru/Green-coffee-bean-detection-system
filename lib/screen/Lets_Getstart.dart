import 'package:flutter/material.dart';
import 'package:coffee_been_detection_system/screen/Login.dart';
import 'package:coffee_been_detection_system/screen/Signup.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  final ValueNotifier<bool> _dark = ValueNotifier<bool>(true);
  final ValueNotifier<double> _widthFactor = ValueNotifier<double>(1.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
      },
      home: ValueListenableBuilder<bool>(
        valueListenable: _dark,
        builder: (context, color, child) {
          return ValueListenableBuilder<double>(
            valueListenable: _widthFactor,
            builder: (context, factor, child) {
              return Scaffold(
                backgroundColor: _dark.value ? Colors.black : Colors.white,
                appBar: AppBar(
                  actions: [
                    Switch(
                      value: _dark.value,
                      onChanged: (value) {
                        _dark.value = value;
                      },
                    ),
                    DropdownButton<double>(
                      value: _widthFactor.value,
                      onChanged: (value) {
                        _widthFactor.value = value!;
                      },
                      items: [
                        DropdownMenuItem<double>(
                          value: 0.5,
                          child: Text('Size: 50%'),
                        ),
                        DropdownMenuItem<double>(
                          value: 0.75,
                          child: Text('Size: 75%'),
                        ),
                        DropdownMenuItem<double>(
                          value: 1.0,
                          child: Text('Size: 100%'),
                        ),
                      ],
                    ),
                  ],
                ),
                body: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * _widthFactor.value,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [Home()],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    const horizontalPadding = 28.0;

    return Container(
      width: screenWidth * 0.9,
      height: screenHeight * 0.85,  // Reduced from 0.9 to 0.85
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.00, -1.00),
          end: Alignment(0, 1),
          colors: [Color(0xFF9ED60B), Color(0xFF537006)],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45),
        ),
      ),
      child: Stack(
        children: [
          // Background elements
          Positioned(
            left: screenWidth * 0.2,
            top: -screenWidth * 0.2,
            child: Container(
              width: screenWidth * 1.2,
              height: screenWidth * 1.0,
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.3),
                shape: OvalBorder(),
              ),
            ),
          ),
          
          // Main image
          Positioned(
            left: screenWidth * 0.1,
            top: screenWidth * 0.15,
            child: Container(
              width: screenWidth * 0.8,
              height: screenWidth * 0.6,  // Reduced from 0.7
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/picsum.photos.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          
          // "Let's get started" text
          Positioned(
            left: horizontalPadding,
            top: screenWidth * 0.9,  // Reduced from 1.0
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Let\'s',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontFamily: 'Sora',
                    height: 1.2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    'get started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontFamily: 'Sora',
                      height: 1.2,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // "Everything starts from here" text
          Positioned(
            left: horizontalPadding,
            top: screenWidth * 1.2,  // Reduced from 1.4
            child: Text(
              'Everything start from here',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Sora',
                height: 0,
              ),
            ),
          ),
          
          // Login button 
          Positioned(
            left: horizontalPadding,
            right: horizontalPadding,
            top: screenWidth * 1.4,  // Reduced from 1.6
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(vertical: 15),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Color(0xFFFFCA41),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      color: Color(0xFF10405A),
                      fontSize: 18,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w600,
                      height: 1.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          
          // Signup button 
          Positioned(
            left: horizontalPadding,
            right: horizontalPadding,
            top: screenWidth * 1.55,  // Reduced from 1.8
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(vertical: 15),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Color(0xFFD5E6D4),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      color: Color(0xFF10405A),
                      fontSize: 18,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w600,
                      height: 1.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          
          // Bottom indicator
          Positioned(
            left: 5,
            bottom: 10,
            child: Container(
              width: screenWidth * 0.9,
              height: 34,
              padding: const EdgeInsets.only(
                top: 21,
                left: 121,
                right: 120,
                bottom: 8,
              ),
              child: Center(
                child: Container(
                  width: 134,
                  height: 5,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
            ),
          ),
          
          // Status bar (optional)
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: screenWidth * 0.9,
              height: 44,
              padding: EdgeInsets.symmetric(horizontal: 21),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '9:41',
                    style: TextStyle(
                      color: Color(0xFF1E535F),
                      fontSize: 15,
                      fontFamily: 'SF Pro Text',
                      fontWeight: FontWeight.w600,
                      height: 1.0,
                    ),
                  ),
                  Row(
                    children: [
                      Container(width: 17, height: 10.67),
                      SizedBox(width: 10),
                      Container(width: 15.33, height: 11),
                      SizedBox(width: 10),
                      Container(
                        width: 24.33,
                        height: 11.33,
                        child: Stack(
                          children: [
                            Opacity(
                              opacity: 0.35,
                              child: Container(
                                width: 22,
                                height: 11.33,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      color: Color(0xFF1E535F),
                                    ),
                                    borderRadius: BorderRadius.circular(2.67),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 2,
                              top: 2,
                              child: Container(
                                width: 18,
                                height: 7.33,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF1E535F),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1.33),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}