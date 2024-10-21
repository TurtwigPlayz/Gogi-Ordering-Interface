import 'package:flutter/material.dart';

class InkwellButton extends StatelessWidget {
  const InkwellButton({
    super.key,
    required this.onTap,
    this.title,
    this.icon,
    this.padding = 10.0,
    this.iconSize = 20.0,
    this.borderRadius = 10.0,
  });

  final VoidCallback onTap;
  final String? title;
  final IconData? icon;
  final double padding;
  final double iconSize;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withOpacity(0.05),
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Row(
            children: <Widget>[
              if (icon != null) Icon(
                icon,
                size: iconSize,
                color: Theme.of(context).iconTheme.color,
              ),
              if (title != null) ...<Widget>[
                const SizedBox(width: 10.0),
                Text(
                  title!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
