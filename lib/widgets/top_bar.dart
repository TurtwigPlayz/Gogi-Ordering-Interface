import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      title: const Text('Nav bar and history button'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}