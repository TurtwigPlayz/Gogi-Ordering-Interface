import 'package:flutter/material.dart';
import 'package:gogi_ordering_interface/providers/theme_provider.dart';
import 'package:provider/provider.dart';
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
    ),
    MenuItemModel(
      name: 'Kimchi',
      unitPrice: 4.99,
      imagePath: 'images/menu/kimchi.jpg',
    ),
  ];

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SessionProvider(menuItems)),
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
