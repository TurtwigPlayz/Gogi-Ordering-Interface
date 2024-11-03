import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gogi_ordering_interface/theme_data.dart';
import 'package:gogi_ordering_interface/providers/session_provider.dart';
import 'package:gogi_ordering_interface/widgets/inkwell_button.dart';
import 'package:gogi_ordering_interface/widgets/order_item.dart';
import 'package:gogi_ordering_interface/widgets/tagged_text.dart';

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

  Widget _buildTotalCostTag(BuildContext context, String text, double cost) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Material(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Text(text, style: Theme.of(context).textTheme.bodySmall),
                  const Expanded(child: SizedBox()),
                  TaggedText(
                      text: '\$${cost.toStringAsPrecision(3)}',
                      backgroundColor: greenColor),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    const double itemSpacing = 10.0;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: Theme.of(context).cardColor, width: 1),
        ),
      ),
      width: 300.0,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Consumer<SessionProvider>(
          builder: (context, session, child) => Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      if (!_isViewingOrderHistory)
                        ...session.currentOrder.values.expand((item) {
                          return <Widget>[
                            OrderItem(model: item),
                            const SizedBox(
                                height:
                                    itemSpacing), // Adjust the height as needed
                          ];
                        })
                      else
                        ...session.orderHistory.expand((item) {
                          return <Widget>[
                            OrderItem(
                              model: item,
                              isHistorical: true,
                            ),
                            const SizedBox(
                                height:
                                    itemSpacing), // Adjust the height as needed
                          ];
                        }),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              _buildTotalCostTag(context, 'Order Cost', session.orderTotalCost),
              const SizedBox(height: 10.0),
              _buildTotalCostTag(
                  context, 'Current Cost', session.currentTotalCost),
              const SizedBox(height: 20.0),
              if (!_isViewingOrderHistory)
                InkwellButton(
                  onTap: () => _toggleView(),
                  title: 'Order History',
                  icon: Icons.history,
                )
              else
                InkwellButton(
                  onTap: () => _toggleView(),
                  title: 'Back To Order',
                  icon: Icons.arrow_back,
                ),
              const SizedBox(height: 10.0),
              InkwellButton(
                onTap: () => {},
                title: 'Order Now',
                icon: Icons.shopping_cart_checkout,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
