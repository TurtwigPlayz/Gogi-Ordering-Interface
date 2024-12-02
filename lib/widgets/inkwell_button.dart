import 'package:flutter/foundation.dart';
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

    final borderRadius = this.borderRadius *
        clampDouble(MediaQuery.of(context).size.width * 0.001, 1.0, 1.3);

    return Material(
      color: Theme.of(context).shadowColor,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        splashColor: color.withOpacity(0.75),
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
                  size: iconSize *
                      clampDouble(
                        MediaQuery.of(context).size.width * 0.0015,
                        0.7,
                        1.5,
                      ),
                  color: color,
                ),
              if (title != null) ...<Widget>[
                const SizedBox(width: 10.0),
                Text(
                  title!,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: color,
                        fontSize: clampDouble(
                          MediaQuery.of(context).size.width * 0.015,
                          12.0,
                          16.0,
                        ),
                      ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
