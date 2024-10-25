import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: TabBar(
        labelColor: Theme.of(context).textTheme.bodyMedium!.color,
        unselectedLabelColor: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.5),
        indicatorColor: Theme.of(context).textTheme.bodyMedium!.color,
        tabs: const <Widget>[
          Tab(text: 'Tab 1'),
          Tab(text: 'Tab 2'),
          Tab(text: 'Tab 3'),
          Tab(text: 'Tab 4'),
          Tab(text: 'Tab 5'),
        ],
      ),
    );
  }
}
