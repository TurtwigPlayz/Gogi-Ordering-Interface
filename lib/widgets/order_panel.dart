import 'package:flutter/material.dart';
import 'package:gogi_ordering_interface/widgets/inkwell_button.dart';

class OrderPanel extends StatefulWidget {
  const OrderPanel({super.key});

  @override
  State<OrderPanel> createState() => _OrderPanelState();
}

class _OrderPanelState extends State<OrderPanel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: <Widget>[
          InkwellButton(
            onTap: () => {},
            title: 'Order History',
            icon: Icons.history,
          ),
        ],
      ),
    );
  }
}