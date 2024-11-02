import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: const ColorFilter.matrix(<double>[
        -1, 0, 0, 0, 255, // Red
        0, -1, 0, 0, 255, // Green
        0, 0, -1, 0, 255, // Blue
        0, 0, 0, 1, 0, // Alpha
      ]),
      child: Image.asset(
        'lib/images/logo.png',
        height: 65,
      ),
    );
    // Image.asset(
    //   'lib/images/logo.png',
    //   height: 80,
    // ),
  }
}
