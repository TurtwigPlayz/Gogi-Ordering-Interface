import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gogi_ordering_interface/models/menu_item_model.dart';
import 'package:gogi_ordering_interface/providers/session_provider.dart';
import 'package:gogi_ordering_interface/theme_data.dart';
import 'package:gogi_ordering_interface/widgets/bottom_bar.dart';
import 'package:gogi_ordering_interface/widgets/menu_container.dart';
import 'package:gogi_ordering_interface/widgets/order_panel.dart';
import 'package:gogi_ordering_interface/widgets/top_bar.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => SessionProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final session = Provider.of<SessionProvider>(context, listen: false);

    // Some hardcoded menu items
    const MenuItemModel porkBelly = MenuItemModel(
      name: 'Pork Belly',
      unitPrice: 12.99
    );

    const MenuItemModel kimchi = MenuItemModel(
      name: 'Kimchi',
      unitPrice: 4.99
    );

    // Defer adding items to order for testing
    Future.delayed(const Duration(seconds: 1), () {
      session.addToOrder(porkBelly);
      session.addToOrder(kimchi);
      session.addToOrder(kimchi);
    });

    return MaterialApp(
      title: 'Gogi Ordering Interface',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: const Scaffold(
        body: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  TopBar(),
                  Expanded(
                    child: MenuContainer(),
                  ),
                  BottomBar(),
                ],
              ),
            ),
            OrderPanel(),
          ],
        ),
      ),
    );
  }
}
