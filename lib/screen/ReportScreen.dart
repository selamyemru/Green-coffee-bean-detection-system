import 'package:flutter/material.dart';

void main() {
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget {
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
                      backgroundColor:
                          _dark.value ? Colors.black : Colors.white,
                      // appBar: AppBar(
                      //   actions: [
                      //     Switch(
                      //       value: _dark.value,
                      //       onChanged: (value) {
                      //         _dark.value = value;
                      //       },
                      //     ),
                      //     DropdownButton<double>(
                      //       value: _widthFactor.value,
                      //       onChanged: (value) {
                      //         _widthFactor.value = value!;
                      //       },
                      //       items: [
                      //         DropdownMenuItem<double>(
                      //           value: 0.5,
                      //           child: Text('Size: 50%'),
                      //         ),
                      //         DropdownMenuItem<double>(
                      //           value: 0.75,
                      //           child: Text('Size: 75%'),
                      //         ),
                      //         DropdownMenuItem<double>(
                      //           value: 1.0,
                      //           child: Text('Size: 100%'),
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                      body: Center(
                          child: Container(
                        width: MediaQuery.of(context).size.width *
                            _widthFactor.value,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Home(),
                          ],
                        ),
                      )));
                },
              );
            }));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 393,
          height: 852,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(45),
            ),
          ),
          child: Stack(
            children: [
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
                      colors: [Color(0xFFDBF5DF), Color(0xFCE5F6E8), Color(0x00E3FAE7)],
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
                      colors: [Color(0xE5E5F6E8), Color(0x00E3FAE7)],
                    ),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 24,
                top: 186,
                child: Container(
                  width: 323,
                  height: 241.79,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 9.85,
                        top: 104.23,
                        child: Container(
                          width: 283.29,
                          height: 110.51,
                          child: Stack(children: [
                          
                          ]),
                        ),
                      ),
                      Positioned(
                        left: 0.71,
                        top: 133.01,
                        child: Container(
                          width: 34.89,
                          height: 57.05,
                          child: Stack(children: [
                          
                          ]),
                        ),
                      ),
                      Positioned(
                        left: 31.08,
                        top: 0,
                        child: Container(
                          width: 164.54,
                          height: 190.98,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 164.54,
                                  height: 190.98,
                                  child: Stack(children: [
                                  
                                  ]),
                                ),
                              ),
                              Positioned(
                                left: 82.57,
                                top: 20.44,
                                child: Container(
                                  width: 68.32,
                                  height: 118.65,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 8.41,
                                        top: 15.49,
                                        child: Opacity(
                                          opacity: 0.24,
                                          child: Container(
                                            width: 55.52,
                                            height: 94.27,
                                            child: Stack(children: [
                                            
                                            ]),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 17.37,
                                top: 54.60,
                                child: Container(
                                  width: 62.30,
                                  height: 69.92,
                                  child: Stack(children: [
                                  
                                  ]),
                                ),
                              ),
                              Positioned(
                                left: 45.88,
                                top: 73.64,
                                child: Container(
                                  width: 8.92,
                                  height: 5.35,
                                  child: Stack(children: [
                                  
                                  ]),
                                ),
                              ),
                              Positioned(
                                left: 30.75,
                                top: 108.88,
                                child: Container(
                                  width: 40.48,
                                  height: 52.69,
                                  child: Stack(children: [
                                  
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 71.94,
                        top: 137.33,
                        child: Container(
                          width: 131.50,
                          height: 69.87,
                          child: Stack(children: [
                          
                          ]),
                        ),
                      ),
                      Positioned(
                        left: 238.77,
                        top: 4.51,
                        child: Container(
                          width: 31.22,
                          height: 37.25,
                          child: Stack(children: [
                      
                          ]),
                        ),
                      ),
                      Positioned(
                        left: 161.77,
                        top: 46.24,
                        child: Container(
                          width: 158.48,
                          height: 158.30,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 80.56,
                                top: 67.48,
                                child: Opacity(
                                  opacity: 0.20,
                                  child: Container(
                                    width: 27.70,
                                    height: 13.13,
                                    child: Stack(children: [
                                    
                                    ]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 5,
                top: 818,
                child: Container(
                  width: 375,
                  height: 34,
                  padding: const EdgeInsets.only(
                    top: 21,
                    left: 121,
                    right: 120,
                    bottom: 8,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
              ),
              Positioned(
                left: 32,
                top: 721,
                child: Container(
                  width: 329,
                  height: 48,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 132, vertical: 10),
                          decoration: ShapeDecoration(
                            color: Color(0xFF537006),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Get started',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Code Next-Trial',
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 23,
                top: 482,
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 329,
                        child: Text(
                          'Get Reports',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF537006),
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            height: 0.07,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 329,
                        child: Text(
                          'Generate reports & share insights in one tap!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            height: 0.08,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 375,
                  height: 44,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 21,
                        top: 14,
                        child: SizedBox(
                          width: 54,
                          child: Text(
                            '9:41',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF1E535F),
                              fontSize: 15,
                              fontFamily: 'SF Pro Text',
                              height: 0,
                              letterSpacing: -0.30,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 336.33,
                        top: 17.33,
                        child: Container(
                          width: 24.33,
                          height: 11.33,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Opacity(
                                  opacity: 0.35,
                                  child: Container(
                                    width: 22,
                                    height: 11.33,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(width: 1, color: Color(0xFF1E535F)),
                                        borderRadius: BorderRadius.circular(2.67),
                                      ),
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
                      ),
                      Positioned(
                        left: 316,
                        top: 17.33,
                        child: Container(
                          width: 15.33,
                          height: 11,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/report.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 294,
                        top: 17.67,
                        child: Container(
                          width: 17,
                          height: 10.67,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/report.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}