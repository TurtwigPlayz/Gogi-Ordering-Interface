import 'package:flutter/material.dart';
import 'package:gogi_ordering_interface/models/order_item_model.dart';
import 'package:provider/provider.dart';
import 'package:gogi_ordering_interface/providers/session_provider.dart';
import 'package:gogi_ordering_interface/widgets/inkwell_button.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.model,
    this.isHistorical = false,
  });

  final OrderItemModel model;
  final bool isHistorical;

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = BorderRadius.circular(10.0);

    const double iconBorderRadius = 20.0;
    const double iconPadding = 7.0;

    final session = Provider.of<SessionProvider>(context, listen: false);

    return Material(
      color: Theme.of(context).cardColor,
      borderRadius: borderRadius,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      model.menuItem.name,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      'x${model.quantity}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                const SizedBox(height: 5.0),
                Text(
                  '\$${model.menuItem.unitPrice * model.quantity}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            if (!isHistorical) ...<Widget>[
              const Expanded(child: SizedBox()),
              InkwellButton(
                onTap: () => {},
                icon: Icons.edit,
                splashColor: Colors.green,
                borderRadius: iconBorderRadius,
                padding: iconPadding,
              ),
              const SizedBox(width: 8.0),
              InkwellButton(
                onTap: () => session.removeFromOrder(model.menuItem),
                icon: Icons.delete,
                splashColor: Colors.red,
                borderRadius: iconBorderRadius,
                padding: iconPadding,
              ),
            ],
          ],
        ),
      ),
    );
  }
}