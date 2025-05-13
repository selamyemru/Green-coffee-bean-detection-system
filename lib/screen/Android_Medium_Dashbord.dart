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
                        width: MediaQuery.of(context).size.width *
                            _widthFactor.value,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AndroidMediumDashboard(),
                          ],
                        ),
                      )));
                },
              );
            }));
  }
}

class AndroidMediumDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 700,
          height: 1237,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 39,
                top: 42,
                child: Container(
                  width: 623,
                  height: 58,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Dashboard',
                        style: TextStyle(
                          color: Color(0xFFAA792A),
                          fontSize: 24,
                          fontFamily: 'Inter',
                          height: 0,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 65,
                        height: 59,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 41,
                              height: 41,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 98,
                top: 667,
                child: Container(
                  width: 504,
                  height: 513,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 504,
                          height: 513,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 504,
                                  height: 513,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28.54),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 504,
                                  height: 513,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28.54),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 25.20,
                                top: 158.10,
                                child: Container(
                                  width: 504,
                                  height: 272.48,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 13.44,
                                        top: 0,
                                        child: Container(
                                          width: 490.56,
                                          height: 23.55,
                                          padding: const EdgeInsets.only(top: 2),
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                width: 34.15,
                                                child: Text(
                                                  '\$1k',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color: Color(0xFF92929D),
                                                    fontSize: 17.12,
                                                    fontFamily: 'Inter',
                                                    height: 0,
                                                    letterSpacing: 0.12,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 16.25),
                                              Container(
                                                width: 440.16,
                                                height: 1.68,
                                                decoration: BoxDecoration(color: Color(0xFFF1F1F5)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 62.23,
                                        child: Container(
                                          width: 504,
                                          height: 23.55,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                width: 50.63,
                                                child: Text(
                                                  '\$750',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color: Color(0xFF92929D),
                                                    fontSize: 17.12,
                                                    fontFamily: 'Inter',
                                                    height: 0,
                                                    letterSpacing: 0.12,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 16.57),
                                              Container(
                                                width: 440.16,
                                                height: 1.68,
                                                decoration: BoxDecoration(color: Color(0xFFF1F1F5)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 124.47,
                                        child: Container(
                                          width: 504,
                                          height: 23.55,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                width: 51.81,
                                                child: Text(
                                                  '\$500',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color: Color(0xFF92929D),
                                                    fontSize: 17.12,
                                                    fontFamily: 'Inter',
                                                    height: 0,
                                                    letterSpacing: 0.12,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 17.07),
                                              Container(
                                                width: 440.16,
                                                height: 1.68,
                                                decoration: BoxDecoration(color: Color(0xFFF1F1F5)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 186.70,
                                        child: Container(
                                          width: 504,
                                          height: 23.55,
                                          padding: const EdgeInsets.only(top: 2),
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                width: 50.63,
                                                child: Text(
                                                  '\$250',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color: Color(0xFF92929D),
                                                    fontSize: 17.12,
                                                    fontFamily: 'Inter',
                                                    height: 0,
                                                    letterSpacing: 0.12,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 16.57),
                                              Container(
                                                width: 440.16,
                                                height: 1.68,
                                                decoration: BoxDecoration(color: Color(0xFFF1F1F5)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 23.52,
                                        top: 248.93,
                                        child: Container(
                                          width: 480.48,
                                          height: 23.55,
                                          padding: const EdgeInsets.only(top: 2),
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                width: 25.90,
                                                child: Text(
                                                  '\$0',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color: Color(0xFF92929D),
                                                    fontSize: 17.12,
                                                    fontFamily: 'Inter',
                                                    height: 0,
                                                    letterSpacing: 0.12,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 17.78),
                                              Container(
                                                width: 440.16,
                                                height: 1.68,
                                                decoration: BoxDecoration(color: Color(0xFFF1F1F5)),
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
                                left: 99.12,
                                top: 159.79,
                                child: Container(
                                  width: 372.96,
                                  height: 327.98,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 262.08,
                                        top: 0,
                                        child: Container(
                                          width: 45.36,
                                          height: 327.98,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 48.28,
                                                child: Text(
                                                  'May',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color(0xFF92929D),
                                                    fontSize: 19.97,
                                                    fontFamily: 'Inter',
                                                    height: 0.09,
                                                    letterSpacing: 0.14,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 198.24,
                                        top: 35.32,
                                        child: Container(
                                          width: 38.64,
                                          height: 292.66,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 40.03,
                                                child: Text(
                                                  'Apr',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color(0xFF92929D),
                                                    fontSize: 19.97,
                                                    fontFamily: 'Inter',
                                                    height: 0.09,
                                                    letterSpacing: 0.14,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 131.04,
                                        top: 68.96,
                                        child: Container(
                                          width: 42,
                                          height: 259.02,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 43.57,
                                                child: Text(
                                                  'Mar',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color(0xFF92929D),
                                                    fontSize: 19.97,
                                                    fontFamily: 'Inter',
                                                    height: 0.09,
                                                    letterSpacing: 0.14,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 65.52,
                                        top: 18.50,
                                        child: Container(
                                          width: 40.32,
                                          height: 309.48,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 42.39,
                                                child: Text(
                                                  'Feb',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color(0xFF92929D),
                                                    fontSize: 19.97,
                                                    fontFamily: 'Inter',
                                                    height: 0.09,
                                                    letterSpacing: 0.14,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 332.64,
                                        top: 0,
                                        child: Container(
                                          width: 40.32,
                                          height: 327.98,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 41.21,
                                                child: Text(
                                                  'Jun',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color(0xFF92929D),
                                                    fontSize: 19.97,
                                                    fontFamily: 'Inter',
                                                    height: 0.09,
                                                    letterSpacing: 0.14,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 52.14,
                                        child: Container(
                                          width: 40.32,
                                          height: 275.84,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 41.21,
                                                child: Text(
                                                  'Jan',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color(0xFF92929D),
                                                    fontSize: 19.97,
                                                    fontFamily: 'Inter',
                                                    height: 0.09,
                                                    letterSpacing: 0.14,
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
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 211.68,
                        top: 85.78,
                        child: Container(
                          padding: const EdgeInsets.only(top: 3, bottom: 2.37),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 13.44,
                                height: 16.82,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF513CD5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.56),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8.40),
                              SizedBox(
                                width: 142.47,
                                child: Text(
                                  'Offline Sales',
                                  style: TextStyle(
                                    color: Color(0xFF44444F),
                                    fontSize: 19.97,
                                    fontFamily: 'Inter',
                                    height: 0.09,
                                    letterSpacing: 0.14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 25.20,
                        top: 85.78,
                        child: Container(
                          padding: const EdgeInsets.only(top: 3, bottom: 2.37),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 13.44,
                                height: 16.82,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFFFA800),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.56),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8.40),
                              SizedBox(
                                width: 138.94,
                                child: Text(
                                  'Online Sales',
                                  style: TextStyle(
                                    color: Color(0xFF44444F),
                                    fontSize: 19.97,
                                    fontFamily: 'Inter',
                                    height: 0.09,
                                    letterSpacing: 0.14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 25.20,
                        top: 51.40,
                        child: SizedBox(
                          width: 167.20,
                          child: Text(
                            'Sales Report',
                            style: TextStyle(
                              color: Color(0xFF171625),
                              fontSize: 22.83,
                              fontFamily: 'Inter',
                              height: 0,
                              letterSpacing: 0.14,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 218.40,
                        top: 53.54,
                        child: SizedBox(
                          width: 120.10,
                          child: Text(
                            '2017-2018',
                            style: TextStyle(
                              color: Color(0xFF696974),
                              fontSize: 19.97,
                              fontFamily: 'Inter',
                              height: 0,
                              letterSpacing: 0.14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 15,
                top: 411,
                child: Container(
                  width: 685,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 338.17,
                          height: 95.59,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 338.17,
                                  height: 95.59,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28.54),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 338.17,
                                  height: 95.59,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28.54),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 16.91,
                                top: 22.83,
                                child: Container(
                                  width: 148.92,
                                  height: 70.82,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 11.27,
                                        top: 14.27,
                                        child: Container(
                                          width: 18.04,
                                          height: 22.83,
                                          padding: const EdgeInsets.only(
                                            top: 1.41,
                                            left: 1.50,
                                            right: 1.11,
                                            bottom: 1.90,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                            
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 46.22,
                                        top: 0,
                                        child: SizedBox(
                                          width: 34.76,
                                          child: Text(
                                            '63%',
                                            style: TextStyle(
                                              color: Color(0xFF171625),
                                              fontSize: 19.97,
                                              fontFamily: 'Inter',
                                              height: 0,
                                              letterSpacing: 0.14,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 46.22,
                                        top: 32.82,
                                        child: SizedBox(
                                          width: 102.71,
                                          child: Text(
                                            'Hit Rate this year',
                                            style: TextStyle(
                                              color: Color(0xFF696974),
                                              fontSize: 15.69,
                                              fontFamily: 'Inter',
                                              height: 0,
                                              letterSpacing: 0.11,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 184.87,
                                top: 21.40,
                                child: Container(
                                  width: 141.81,
                                  height: 74.82,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 11.27,
                                        top: 15.69,
                                        child: Container(
                                          width: 18.04,
                                          height: 22.83,
                                          padding: const EdgeInsets.only(
                                            top: 2.85,
                                            left: 0.75,
                                            right: 0.75,
                                            bottom: 1.90,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                            
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 46.22,
                                        top: -0,
                                        child: SizedBox(
                                          width: 30.81,
                                          child: Text(
                                            '71%',
                                            style: TextStyle(
                                              color: Color(0xFF171625),
                                              fontSize: 19.97,
                                              fontFamily: 'Inter',
                                              height: 0,
                                              letterSpacing: 0.14,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 46.22,
                                        top: 32.82,
                                        child: SizedBox(
                                          width: 95.60,
                                          child: Text(
                                            'Deals this year',
                                            style: TextStyle(
                                              color: Color(0xFF696974),
                                              fontSize: 17.12,
                                              fontFamily: 'Inter',
                                              height: 0,
                                              letterSpacing: 0.12,
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
                      ),
                      Positioned(
                        left: 346.83,
                        top: 0,
                        child: Container(
                          width: 338.17,
                          height: 111.29,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 338.17,
                                  height: 111.29,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28.54),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 338.17,
                                  height: 111.29,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28.54),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 16.91,
                                top: 21.40,
                                child: Container(
                                  width: 134.14,
                                  height: 68.49,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: -1.69,
                                        top: -0,
                                        child: SizedBox(
                                          width: 75.84,
                                          child: Text(
                                            '14,254',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xFF171725),
                                              fontSize: 28.54,
                                              fontFamily: 'Inter',
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 83.41,
                                        top: 7.13,
                                        child: SizedBox(
                                          width: 37.20,
                                          child: Text(
                                            '1.5%',
                                            style: TextStyle(
                                              color: Color(0xFFFC5959),
                                              fontSize: 19.97,
                                              fontFamily: 'Inter',
                                              height: 0,
                                              letterSpacing: 0.12,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 120.61,
                                        top: 12.84,
                                        child: Container(
                                          width: 13.53,
                                          height: 17.12,
                                          padding: const EdgeInsets.symmetric(horizontal: 2.25, vertical: 2.14),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                            
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: -0,
                                        top: 48.51,
                                        child: SizedBox(
                                          width: 108.24,
                                          child: Text(
                                            'Visitors this year',
                                            style: TextStyle(
                                              color: Color(0xFF696974),
                                              fontSize: 17.12,
                                              fontFamily: 'Inter',
                                              height: 0,
                                              letterSpacing: 0.12,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 200.65,
                                top: 37.10,
                                child: Container(
                                  width: 109.34,
                                  height: 38.52,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 71.02,
                                        top: -0,
                                        child: Container(
                                          width: 11.27,
                                          height: 14.27,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFF597807),
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(width: 2.14, color: Colors.white),
                                              borderRadius: BorderRadius.circular(7.13),
                                            ),
                                            shadows: [
                                              BoxShadow(
                                                color: Color(0x2644444F),
                                                blurRadius: 2.85,
                                                offset: Offset(0, 1.43),
                                                spreadRadius: 0,
                                              )
                                            ],
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