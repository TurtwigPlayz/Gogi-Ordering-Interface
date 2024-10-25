import 'package:flutter/material.dart';

class MenuContainer extends StatelessWidget {
  const MenuContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const TabBarView(
        children: [
          Center(child: Text('Content for Tab 1')),
          Center(child: Text('Content for Tab 2')),
          Center(child: Text('Content for Tab 3')),
          Center(child: Text('Content for Tab 4')),
          Center(child: Text('Content for Tab 5')),
        ],
      ),
    );
  }
}
