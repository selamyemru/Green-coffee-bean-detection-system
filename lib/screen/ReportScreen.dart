import 'package:flutter/material.dart';

void main() {
  runApp(ReportScreen());
}

class ReportScreen extends StatelessWidget {
  final ValueNotifier<bool> _dark = ValueNotifier<bool>(true);
  final ValueNotifier<double> _widthFactor = ValueNotifier<double>(1.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ValueListenableBuilder<bool>(
        valueListenable: _dark,
        builder: (context, color, child) {
          return ValueListenableBuilder<double>(
            valueListenable: _widthFactor,
            builder: (context, factor, child) {
              return Scaffold(
                backgroundColor: _dark.value ? Colors.black : Colors.white,
                body: SafeArea(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 393, // Maximum width for the content
                      ),
                      child: FractionallySizedBox(
                        widthFactor: _widthFactor.value,
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.white, // Instead of using ShapeDecoration
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              children: [
                // Status bar
                Container(
                  height: 44,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '9:41',
                        style: TextStyle(
                          color: Color(0xFF1E535F),
                          fontSize: 15,
                          fontFamily: 'SF Pro Text',
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 17,
                            height: 10.67,
                            color: Colors.grey[200],
                          ),
                          SizedBox(width: 8),
                          Container(
                            width: 15.33,
                            height: 11,
                            color: Colors.grey[200],
                          ),
                          SizedBox(width: 8),
                          Container(
                            width: 24.33,
                            height: 11.33,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.67),
                              border: Border.all(
                                color: Color(0xFF1E535F),
                                width: 1,
                              ),
                            ),
                            child: Container(
                              margin: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Color(0xFF1E535F),
                                borderRadius: BorderRadius.circular(1.33),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Main content
                SizedBox(height: 100),
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0,
                        top: -50,
                        child: Container(
                          width: 200,
                          height: 200,
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
                          width: 200,
                          height: 200,
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
                      Center(
                        child: Container(
                          width: 200,
                          height: 200,
                          color: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),

                // Text content
                SizedBox(height: 40),
                Text(
                  'Get Started',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF537006),
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Generate reports & share insights in one tap!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 18,
                    fontFamily: 'Poppins',
                  ),
                ),

                // Button
                SizedBox(height: 40),
                Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Color(0xFF537006),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      'Get started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Code Next-Trial',
                      ),
                    ),
                  ),
                ),

                // Bottom indicator
                SizedBox(height: 40),
                Container(
                  width: 134,
                  height: 5,
                  decoration: ShapeDecoration(
                    color: Color(0xFF0B202B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
