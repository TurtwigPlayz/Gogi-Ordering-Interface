import 'package:flutter/material.dart';
import 'package:gogi_ordering_interface/theme_data.dart';
import 'package:gogi_ordering_interface/widgets/bottom_bar.dart';
import 'package:gogi_ordering_interface/widgets/menu_container.dart';
import 'package:gogi_ordering_interface/widgets/order_panel.dart';
import 'package:gogi_ordering_interface/widgets/top_bar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gogi Ordering Interface',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
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
      ),
    );
  }
}
