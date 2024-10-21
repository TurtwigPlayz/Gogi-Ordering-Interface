import 'package:flutter/material.dart';

// This will eventually become a stateful widget
class MenuContainer extends StatelessWidget {
  const MenuContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Center(
        child: Text('Menu items here'),
      ),
    );
  }
}