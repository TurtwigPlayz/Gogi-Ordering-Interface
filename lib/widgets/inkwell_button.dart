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
    this.splashColor,
  });

  final VoidCallback onTap;
  final String? title;
  final IconData? icon;
  final Color? splashColor;
  final double padding;
  final double iconSize;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final color =
        splashColor != null ? splashColor! : Theme.of(context).iconTheme.color!;

    return Material(
      color: Theme.of(context).shadowColor,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        splashColor: color.withOpacity(0.2),
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (icon != null)
                Icon(
                  icon,
                  size: iconSize,
                  color: color,
                ),
              if (title != null) ...<Widget>[
                const SizedBox(width: 10.0),
                Text(
                  title!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: color),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
