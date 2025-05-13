import 'package:flutter/material.dart';

void main() {
  runApp(DetectDefectScreen());
}

class DetectDefectScreen extends StatelessWidget {
  final ValueNotifier<bool> _dark = ValueNotifier<bool>(true);
  final ValueNotifier<double> _widthFactor = ValueNotifier<double>(1.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ValueListenableBuilder<bool>(
        valueListenable: _dark,
        builder: (context, darkMode, child) {
          return ValueListenableBuilder<double>(
            valueListenable: _widthFactor,
            builder: (context, factor, child) {
              return Scaffold(
                backgroundColor: darkMode ? Colors.black : Colors.white,
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * factor,
                        padding: EdgeInsets.all(12),
                        child: Home(),
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
    return Column(
      children: [
        Container(
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
            ),
          ),
          child: Stack(
            children: [
              // Background radial gradients
              Positioned(
                left: 188,
                top: -108,
                child: Container(
                  width: 364,
                  height: 364,
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
                left: -193,
                top: -94,
                child: Container(
                  width: 364,
                  height: 364,
                  decoration: ShapeDecoration(
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    SizedBox(height: 160),
                    Container(
                      width: 337,
                      height: 261,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/defect.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Detect Defects',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF537006),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Spot defects instantly—solid, insect damage, broken, and more.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        // Add action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF537006),
                        padding: EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          // Replace with your custom font name if configured
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
