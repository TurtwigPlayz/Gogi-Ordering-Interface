import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
        color: Colors.green,
        child: Center(
          child: Text('Bottom bar here'),
        ),
      );
  }
}