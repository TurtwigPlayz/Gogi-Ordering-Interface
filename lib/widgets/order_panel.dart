import 'package:flutter/material.dart';

class OrderPanel extends StatelessWidget {
  const OrderPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Padding(
        padding: EdgeInsets.all(18.0),
        child: Center(
          child: Text('Order items here'),
        ),
      )
    );
  }
}