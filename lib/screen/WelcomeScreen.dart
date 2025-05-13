import 'package:flutter/material.dart';
import '/screen/DetectDefectScreen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(WelcomeScreen());
}

class WelcomeScreen extends StatelessWidget {
  final ValueNotifier<bool> _dark = ValueNotifier<bool>(true);
  final ValueNotifier<double> _widthFactor = ValueNotifier<double>(1.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/defectscreen': (context) => DetectDefectScreen()},
      debugShowCheckedModeBanner: false,
      home: ValueListenableBuilder<bool>(
        valueListenable: _dark,
        builder: (context, color, child) {
          return ValueListenableBuilder<double>(
            valueListenable: _widthFactor,
            builder: (context, factor, child) {
              return Scaffold(body: Home());
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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      height: screenHeight,
      color: Colors.black,
      child: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: screenWidth,
              height: screenHeight,
              decoration: BoxDecoration(color: Colors.white),
              child: Stack(
                children: [
                  // Gradient circles
                  Positioned(
                    right: -50,
                    top: -50,
                    child: Container(
                      width: 250,
                      height: 250,
                      decoration: ShapeDecoration(
                        gradient: RadialGradient(
                          center: Alignment(0.61, 1.11),
                          radius: 0.71,
                          colors: [
                            Color(0xFFDBF5DF),
                            Color(0xFCE5F6E8),
                            Color(0x00E3FAE7),
                          ],
                        ),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: -100,
                    top: -50,
                    child: Container(
                      width: 250,
                      height: 250,
                      decoration: ShapeDecoration(
                        gradient: RadialGradient(
                          center: Alignment(0.06, 0.28),
                          radius: 0.89,
                          colors: [Color(0xE5E5F6E8), Color(0x00E3FAE7)],
                        ),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),

                  // Center content
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: screenWidth * 0.6,
                          height: screenWidth * 0.6,
                          margin: EdgeInsets.only(top: 60),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/welcome.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Welcome',
                          style: GoogleFonts.poppins(
                            color: Color(0xFF537006),
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.2,
                            shadows: [
                              Shadow(
                                offset: Offset(1.5, 1.5),
                                blurRadius: 3.0,
                                color: Colors.black26,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            'Inspect green coffee beans with AI. Fast, accurate, and easy!',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: Color(0xFF333333),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              height: 1.4,
                              wordSpacing: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Button
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 80,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ), // Optional: adds some margin to the left and right
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF537006),
                            minimumSize: Size(
                              double.infinity,
                              48,
                            ), // Set width to double.infinity to make the button full-width
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius
                                      .all(Radius.circular(5)), // Set to zero to remove rounding (optional)
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/defectscreen');
                          },
                          child: Text(
                            'Next',
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Footer label
                  Positioned(
                    bottom: 30,
                    top: 100,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        'Pure Coffee',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF63860E),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 2.0,
                              color: Colors.black12,
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
    );
  }
}
