import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gogi_ordering_interface/providers/session_provider.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final session = Provider.of<SessionProvider>(context, listen: false);

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: TabBar(
        labelColor: Theme.of(context).textTheme.bodyMedium!.color,
        indicatorColor: Theme.of(context).textTheme.bodyMedium!.color,
        unselectedLabelColor: Theme.of(context).cardColor,
        dividerColor: Theme.of(context).cardColor,
        dividerHeight: 1,
        tabs: <Widget>[
          ...['All', ...session.menuCategories].map(
            (category) => Tab(text: category),
          ),
        ],
      ),
    );
  }
}
