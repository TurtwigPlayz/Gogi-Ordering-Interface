import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gogi_ordering_interface/providers/theme_provider.dart';
import 'package:gogi_ordering_interface/models/menu_item_model.dart';
import 'package:gogi_ordering_interface/providers/session_provider.dart';
import 'package:gogi_ordering_interface/theme_data.dart';
import 'package:gogi_ordering_interface/widgets/bottom_bar.dart';
import 'package:gogi_ordering_interface/widgets/menu_container.dart';
import 'package:gogi_ordering_interface/widgets/order_panel.dart';
import 'package:gogi_ordering_interface/widgets/top_bar.dart';

void main() {
  const menuItems = <MenuItemModel>[
    MenuItemModel(
        name: 'Pork Belly',
        unitPrice: 12.99,
        imagePath: 'images/menu/pork_belly.jpg',
        categories: <String>['Entrees'],
        description:
            "Succulent, tender pork belly slow-cooked to perfection, with a crispy, caramelized outer layer and a melt-in-your-mouth interior. Marinated in a savory blend of soy sauce, garlic, and spices, each bite bursts with rich, smoky flavors. Served with a side of fresh vegetables or pickled radish to balance the richness, this dish is a comforting classic that's perfect for sharing or as a hearty main course. Enjoy it with a dipping sauce or wrapped in lettuce for a traditional experience."),
    MenuItemModel(
        name: 'Kimchi',
        unitPrice: 4.99,
        imagePath: 'images/menu/kimchi.jpg',
        categories: <String>['Sides'],
        description:
            "A traditional Korean side dish made from fermented napa cabbage and radishes, seasoned with a bold blend of garlic, ginger, chili flakes, and fish sauce. Kimchi has a tangy, spicy flavor with a subtle hint of sweetness, offering a unique balance of flavors that complement many dishes. Known for its health benefits, including probiotics and essential vitamins, Kimchi adds a zesty kick to your meal. Enjoy it on its own or as a perfect side to rice, noodles, or grilled meats."),
  ];

  const menuCategories = <String>[
    'Appetizers',
    'Entrees',
    'Sides',
    'Drinks',
  ];

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SessionProvider(menuItems, menuCategories),
        ),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final session = Provider.of<SessionProvider>(context, listen: false);

    // Defer adding items to order for testing
    Future.delayed(const Duration(seconds: 1), () {
      session.addToOrder(session.menuItems[0]);
      session.addToOrder(session.menuItems[1]);
      session.addToOrder(session.menuItems[1]);
    });

    return Consumer<ThemeProvider>(
      builder: (context, theme, child) => MaterialApp(
        title: 'Gogi Ordering Interface',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: theme.themeMode,
        home: const DefaultTabController(
          length: 5, // Number of tabs
          child: Scaffold(
            body: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      TopBar(),
                      Expanded(
                        child: MenuPage(),
                      ),
                      BottomBar(),
                    ],
                  ),
                ),
                OrderPanel(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
