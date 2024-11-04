import 'package:flutter/material.dart';
import 'package:gogi_ordering_interface/theme_data.dart';
import 'package:gogi_ordering_interface/widgets/inkwell_button.dart';

class MessageModal extends StatelessWidget {
  const MessageModal({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 7.0,
          horizontal: 2.0,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300.0),
          child: Text(message),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      actions: <Widget>[
        InkwellButton(
          title: 'Ok',
          onTap: () => Navigator.of(context).pop(),
          icon: Icons.check,
          splashColor: greenColor,
        )
      ],
    );
  }
}
