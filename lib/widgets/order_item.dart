import 'package:flutter/material.dart';
import 'package:gogi_ordering_interface/widgets/inkwell_button.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.title,
    required this.price,
    required this.quantity,
    this.isHistorical = false,
  });

  final String title;
  final double price;
  final int quantity;
  final bool isHistorical;

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = BorderRadius.circular(10.0);

    const double iconBorderRadius = 20.0;
    const double iconPadding = 7.0;

    return Material(
      color: Colors.white.withOpacity(0.1),
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
                      title,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      'x$quantity',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                const SizedBox(height: 5.0),
                Text(
                  '\$$price',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            if (!isHistorical) ...<Widget>[
              const Expanded(child: SizedBox()),
              InkwellButton(
                onTap: () => {},
                icon: Icons.edit,
                borderRadius: iconBorderRadius,
                padding: iconPadding,
              ),
              const SizedBox(width: 8.0),
              InkwellButton(
                onTap: () => {},
                icon: Icons.delete,
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