import 'package:flutter/material.dart';
import 'package:gogi_ordering_interface/widgets/inkwell_button.dart';
import 'package:gogi_ordering_interface/widgets/order_item.dart';

class OrderPanel extends StatefulWidget {
  const OrderPanel({super.key});

  @override
  State<OrderPanel> createState() => _OrderPanelState();
}

class _OrderPanelState extends State<OrderPanel> {
  bool _isViewingOrderHistory = false;

  void _toggleView() {
    setState(() {
      _isViewingOrderHistory = !_isViewingOrderHistory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240.0,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: <Widget>[
            if (!_isViewingOrderHistory) InkwellButton(
              onTap: () => _toggleView(),
              title: 'Order History',
              icon: Icons.history,
            )
            else InkwellButton(
              onTap: () => _toggleView(),
              title: 'Back To Order',
              icon: Icons.arrow_back,
            ),
            const SizedBox(height: 20.0),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    OrderItem(
                      title: 'Pork Belly',
                      price: 12.99,
                      quantity: 2,
                    ),
                    SizedBox(height: 10.0),
                    OrderItem(
                      title: 'Kimchi',
                      price: 4.99,
                      quantity: 1,
                    ),
                    SizedBox(height: 10.0),
                    OrderItem(
                      title: 'Rice',
                      price: 2.99,
                      quantity: 1,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            InkwellButton(
              onTap: () => {},
              title: 'Order Now',
              icon: Icons.shopping_cart_checkout,
            ),
          ],
        ),
      ),
    );
  }
}