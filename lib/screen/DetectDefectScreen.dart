import 'package:flutter/material.dart';
import 'package:coffee_been_detection_system/screen/ReportScreen.dart';

void main() {
  runApp(DetectDefectScreen());
}

class DetectDefectScreen extends StatelessWidget {
  final ValueNotifier<bool> _dark = ValueNotifier<bool>(true);
  final ValueNotifier<double> _widthFactor = ValueNotifier<double>(1.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/reportscreen': (context) => ReportScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: ValueListenableBuilder<bool>(
        valueListenable: _dark,
        builder: (context, darkMode, child) {
          return ValueListenableBuilder<double>(
            valueListenable: _widthFactor,
            builder: (context, factor, child) {
              return Scaffold(
                body: SafeArea(
                  child: Column(
                    children: [
                      // Main content taking full available height
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            width: MediaQuery.of(context).size.width * factor,
                            padding: const EdgeInsets.all(16),
                            child: Home(),
                          ),
                        ),
                      ),
                      // Full-width "Next" button at bottom
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/reportscreen");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF537006),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                      // Line indicator (now below the button)
                      Container(
                        padding: const EdgeInsets.only(bottom: 20), // Added more bottom padding
                        child: Container(
                          width: 134,
                          height: 5,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF0B202B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                      ),
                    ],
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

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Stack(
        children: [
          // Background radial gradients
          Positioned(
            right: -screenWidth * 0.3,
            top: -screenHeight * 0.15,
            child: Container(
              width: screenWidth * 0.8,
              height: screenWidth * 0.8,
              decoration: const ShapeDecoration(
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
            left: -screenWidth * 0.3,
            top: -screenHeight * 0.15,
            child: Container(
              width: screenWidth * 0.8,
              height: screenWidth * 0.8,
              decoration: const ShapeDecoration(
                gradient: RadialGradient(
                  center: Alignment(0.06, 0.28),
                  radius: 0.89,
                  colors: [
                    Color(0xE5E5F6E8),
                    Color(0x00E3FAE7),
                  ],
                ),
                shape: OvalBorder(),
              ),
            ),
          ),
          // Main content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.1),
              Container(
                width: screenWidth * 0.85,
                height: screenWidth * 0.65,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/defect.png"),
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Detect Defects',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF537006),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Spot defects instantly—solid, insect damage, broken, and more.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.1),
            ],
          ),
        ],
      ),
    );
  }
}