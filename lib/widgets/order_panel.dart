import 'package:flutter/material.dart';
import 'package:gogi_ordering_interface/providers/session_provider.dart';
import 'package:gogi_ordering_interface/widgets/inkwell_button.dart';
import 'package:gogi_ordering_interface/widgets/order_item.dart';
import 'package:provider/provider.dart';

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
    const double itemSpacing = 10.0;

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
            Expanded(
              child: SingleChildScrollView(
                child: Consumer<SessionProvider>(
                  builder: (context, session, child) => Column(
                    children: <Widget>[
                      if (!_isViewingOrderHistory) ...session.currentOrder.values.expand((item) {
                        return <Widget>[
                          OrderItem(model: item),
                          const SizedBox(height: itemSpacing), // Adjust the height as needed
                        ];
                      })
                      else ...session.orderHistory.expand((item) {
                        return <Widget>[
                          OrderItem(
                            model: item,
                            isHistorical: true,
                          ),
                          const SizedBox(height: itemSpacing), // Adjust the height as needed
                        ];
                      }),
                    ],
                  ),
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