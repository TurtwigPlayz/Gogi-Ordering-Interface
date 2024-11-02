import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Theme.of(context).cardColor, width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Move the image to the left
          Image.asset(
            'lib/images/GogiLogo.png', // Use the correct asset path
            width: 90,
            height: 30,
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
