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
                            AndroidMediumHome(),
                          ],
                        ),
                      )));
                },
              );
            }));
  }
}

class AndroidMediumHome extends StatelessWidget {
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
                left: 38,
                top: 220,
                child: Container(
                  width: 623,
                  height: 821,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://picsum.photos/623/821"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 4,
                        color: Colors.black.withOpacity(0.15000000596046448),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 38,
                top: 45,
                child: Container(
                  width: 623,
                  height: 137,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 401,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                'Green Coffee Bean Detection',
                                style: TextStyle(
                                  color: Color(0xFF017E09),
                                  fontSize: 28,
                                  fontFamily: 'Inter',
                                  height: 0,
                                ),
                              ),
                            ),
                            const SizedBox(height: 31),
                            Container(
                              width: double.infinity,
                              height: 38,
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 2,
                                    color: Colors.black.withOpacity(0.20000000298023224),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'All',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      height: 0,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    width: 15,
                                    height: 9,
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
                      const SizedBox(width: 44),
                      Container(
                        height: 102,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 27,
                                    height: 21,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFF73734F),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    'Discolored',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              width: double.infinity,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 27,
                                    height: 21,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFF69576D),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    'Moldy Beans',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              width: double.infinity,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 27,
                                    height: 21,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFF00B2A3),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    'Broken and Chipped',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              width: double.infinity,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 27,
                                    height: 21,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFB28800),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    'Insect-Damaged',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      height: 0,
                                    ),
                                  ),
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
                left: 315,
                top: 1084,
                child: Container(
                  width: 69,
                  height: 69,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 69,
                          height: 69,
                          decoration: ShapeDecoration(
                            color: Color(0xFFC3C3C3),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 8.92,
                        top: 8.92,
                        child: Container(
                          width: 51.16,
                          height: 51.16,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 484,
                top: 1099,
                child: Container(
                  width: 177,
                  height: 38,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2,
                        color: Colors.black.withOpacity(0.20000000298023224),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Dashboard',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          height: 0,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 18,
                        height: 18,
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}