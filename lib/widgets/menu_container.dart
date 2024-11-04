import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gogi_ordering_interface/widgets/menu_item.dart';
import 'package:gogi_ordering_interface/providers/session_provider.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final session = Provider.of<SessionProvider>(context, listen: false);

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: TabBarView(
        children: <Widget>[
          ...session.menuItems.map((menuItem) => GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 items per row
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: 0.75,
                ),
                itemCount: 4, // 4 items per page
                itemBuilder: (context, index) {
                  return MenuItem(
                    imagePath: menuItem.imagePath, // Sample image path
                    name: menuItem.name, // Replace with actual item name
                    price:
                        '\$${menuItem.unitPrice.toStringAsFixed(2)}', // Sample price
                  );
                },
              ))
        ],
      ),
    );
  }
}
