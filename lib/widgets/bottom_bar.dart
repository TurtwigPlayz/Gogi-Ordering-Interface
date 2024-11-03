import 'package:flutter/material.dart';
import 'package:gogi_ordering_interface/providers/theme_provider.dart';
import 'package:gogi_ordering_interface/theme_data.dart';
import 'package:gogi_ordering_interface/widgets/icon_inkwell_button.dart';
import 'package:gogi_ordering_interface/widgets/inkwell_button.dart';
import 'package:gogi_ordering_interface/widgets/logo.dart';
import 'package:gogi_ordering_interface/widgets/modals/message_modal.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context, listen: false);

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Theme.of(context).cardColor, width: 1),
        ),
      ),
      padding: const EdgeInsets.only(
        left: 5.0,
        right: 15.0,
        top: 5.0,
        bottom: 5.0,
      ),
      child: Row(
        children: <Widget>[
          const Logo(),
          const SizedBox(width: 7.0),
          IconInkwellButton(
            onTap: () => theme.toggleTheme(),
            icon: theme.themeMode == ThemeMode.dark
                ? Icons.light_mode
                : Icons.dark_mode,
            splashColor:
                theme.themeMode == ThemeMode.dark ? yellowColor : blueColor,
          ),
          const Expanded(child: SizedBox()),
          Row(
            children: <Widget>[
              InkwellButton(
                onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => const MessageModal(
                    message:
                        "Your request has been sent. A waiter will be with you soon.",
                  ),
                ),
                title: 'Request Assistance',
                icon: Icons.help,
              ),
              const SizedBox(width: 10),
              InkwellButton(
                onTap: () => {},
                title: 'Pay Now',
                icon: Icons.payment,
              ),
            ],
          ),
          // Row(
          //   children: [
          //     ElevatedButton(
          //       onPressed: () {
          //         // Open the pop-up dialog
          //         showDialog(
          //           context: context,
          //           builder: (BuildContext context) {
          //             return AlertDialog(
          //               title: const Text('Request Assistance'),
          //               content: const Text('A waiter will be with you soon'),
          //               actions: [
          //                 TextButton(
          //                   onPressed: () {
          //                     Navigator.of(context).pop(); // Close the dialog
          //                   },
          //                   child: const Text('Cancel'),
          //                 ),
          //                 TextButton(
          //                   onPressed: () {
          //                     Navigator.of(context).pop(); // Close the dialog
          //                   },
          //                   child: const Text('Confirm'),
          //                 ),
          //               ],
          //             );
          //           },
          //         );
          //       },
          //       child: const Text('Request Assistance'),
          //       style: ElevatedButton.styleFrom(),
          //     ),
          //     const SizedBox(width: 10), // Spacing between buttons
          //     ElevatedButton(
          //       onPressed: () {
          //         // Open the pop-up dialog
          //         showDialog(
          //           context: context,
          //           builder: (BuildContext context) {
          //             return AlertDialog(
          //               title: const Text('Request Assistance'),
          //               content: const Text('A waiter will be with you soon'),
          //               actions: [
          //                 TextButton(
          //                   onPressed: () {
          //                     Navigator.of(context).pop(); // Close the dialog
          //                   },
          //                   child: const Text('Cancel'),
          //                 ),
          //                 TextButton(
          //                   onPressed: () {
          //                     Navigator.of(context).pop(); // Close the dialog
          //                   },
          //                   child: const Text('Confirm'),
          //                 ),
          //               ],
          //             );
          //           },
          //         );
          //       },
          //       child: const Text('Pay Now'),
          //       style: ElevatedButton.styleFrom(),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
