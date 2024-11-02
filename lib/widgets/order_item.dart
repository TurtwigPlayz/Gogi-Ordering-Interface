import 'package:flutter/material.dart';
import 'package:gogi_ordering_interface/widgets/icon_inkwell_button.dart';
import 'package:provider/provider.dart';
import 'package:gogi_ordering_interface/widgets/tagged_text.dart';
import 'package:gogi_ordering_interface/models/order_item_model.dart';
import 'package:gogi_ordering_interface/theme_data.dart';
import 'package:gogi_ordering_interface/providers/session_provider.dart';

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
                    TaggedText(
                        text: 'x${model.quantity}', backgroundColor: blueColor),
                  ],
                ),
                const SizedBox(height: 5.0),
                TaggedText(
                    text: '\$${model.cost}', backgroundColor: greenColor),
              ],
            ),
            if (!isHistorical) ...<Widget>[
              const Expanded(child: SizedBox()),
              IconInkwellButton(
                onTap: () => {},
                icon: Icons.edit,
              ),
              const SizedBox(width: 8.0),
              IconInkwellButton(
                onTap: () => session.removeFromOrder(model.menuItem),
                icon: Icons.delete,
                splashColor: redColor,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
