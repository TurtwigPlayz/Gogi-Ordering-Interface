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
    // Appetizers
    MenuItemModel(
      name: 'Seafood Pancake',
      unitPrice: 10.99,
      imagePath: 'images/menu/seafood_pancake.jpg',
      categories: <String>['Appetizers'],
      defaultOptions: <String, bool>{
        'Dipping Sauce': true,
        'Extra Spicy': false,
        'Gluten-Free': false,
      },
      description:
          "A savory pancake filled with fresh seafood and green onions, served with a soy-based dipping sauce.",
    ),
    MenuItemModel(
      name: 'Sweet Potato Fries',
      unitPrice: 5.99,
      imagePath: 'images/menu/sweet_potato_fries.jpg',
      categories: <String>['Appetizers'],
      description:
          "Crispy, golden sweet potato fries with a hint of sweetness, perfect as a snack or side.",
    ),
    MenuItemModel(
      name: 'Tteokbokki',
      unitPrice: 7.99,
      imagePath: 'images/menu/tteokbokki.jpg',
      dropdownOptions: <String, List<String>>{
        'Spice Level': <String>['Mild', 'Medium', 'Hot'],
      },
      categories: <String>['Appetizers'],
      description:
          "Chewy rice cakes cooked in a sweet and spicy sauce, accompanied by fish cakes and boiled eggs.",
    ),

    // Entrees
    MenuItemModel(
      name: 'Beef Brisket',
      unitPrice: 16.99,
      imagePath: 'images/menu/beef_brisket.jpeg',
      dropdownOptions: <String, List<String>>{
        'Cooking Style': <String>['Grilled', 'Charcoal'],
        'Sauce': <String>['Soy Garlic', 'Spicy', 'Sweet BBQ'],
      },
      categories: <String>['Entrees'],
      description:
          "Thinly sliced beef brisket, lightly seasoned and ready for grilling, offering a melt-in-your-mouth texture.",
    ),
    MenuItemModel(
      name: 'Beef Short Ribs',
      unitPrice: 18.99,
      imagePath: 'images/menu/galbi.jpg',
      dropdownOptions: <String, List<String>>{
        'Cooking Style': <String>['Grilled', 'Charcoal', 'Braised'],
        'Marinade': <String>['Soy Garlic', 'Spicy', 'Original'],
      },
      categories: <String>['Entrees'],
      description:
          "Juicy, tender beef short ribs marinated in a rich and savory sauce, perfect for grilling.",
    ),
    MenuItemModel(
      name: 'Bibimbap',
      unitPrice: 12.99,
      imagePath: 'images/menu/bibimbap.jpg',
      dropdownOptions: <String, List<String>>{
        'Spice Level': <String>['Mild', 'Medium', 'Hot'],
        'Add Protein': <String>['Beef', 'Chicken', 'Tofu'],
      },
      categories: <String>['Entrees'],
      description:
          "A colorful medley of vegetables, rice, and protein topped with a fried egg and spicy gochujang sauce.",
    ),
    MenuItemModel(
      name: 'Garlic Shrimp',
      unitPrice: 13.99,
      imagePath: 'images/menu/garlic_shrimp.webp',
      dropdownOptions: <String, List<String>>{
        'Cooking Style': <String>['Grilled', 'Pan-Fried'],
      },
      categories: <String>['Entrees'],
      description:
          "Juicy shrimp marinated in garlic and herbs, delivering a burst of flavor with every bite.",
    ),
    MenuItemModel(
      name: 'Grilled Eel (Unagi)',
      unitPrice: 15.99,
      imagePath: 'images/menu/unagi.jpg',
      categories: <String>['Entrees'],
      description:
          "Tender grilled eel glazed with a sweet soy sauce, offering a unique and rich flavor.",
    ),
    MenuItemModel(
      name: 'Pork Belly',
      unitPrice: 12.99,
      imagePath: 'images/menu/pork_belly.jpg',
      dropdownOptions: <String, List<String>>{
        'Cooking Style': <String>['Grilled', 'Fried', 'Roasted'],
        'Sauce': <String>['Soy Garlic', 'Spicy', 'Sweet and Sour'],
      },
      categories: <String>['Entrees'],
      description:
          "Succulent, tender pork belly slow-cooked to perfection, with a crispy, caramelized outer layer and a melt-in-your-mouth interior.",
    ),
    MenuItemModel(
      name: 'Soy Garlic Chicken',
      unitPrice: 14.99,
      imagePath: 'images/menu/soy_garlic_chicken.jpg',
      dropdownOptions: <String, List<String>>{
        'Cooking Style': <String>['Grilled', 'Fried'],
      },
      categories: <String>['Entrees'],
      description:
          "Tender chicken pieces coated in a sweet and savory soy garlic glaze.",
    ),
    MenuItemModel(
      name: 'Spicy Pork Bulgogi',
      unitPrice: 13.99,
      imagePath: 'images/menu/spicy_pork_bulgogi.webp',
      dropdownOptions: <String, List<String>>{
        'Spice Level': <String>['Mild', 'Medium', 'Hot'],
      },
      categories: <String>['Entrees'],
      description:
          "Sliced pork marinated in a fiery blend of chili paste, garlic, and sesame oil.",
    ),

    // Sides
    MenuItemModel(
      name: 'Egg Custard',
      unitPrice: 4.99,
      imagePath: 'images/menu/egg_custard.webp',
      categories: <String>['Desserts'],
      description: "A light and savory steamed egg custard.",
    ),
    MenuItemModel(
      name: 'Grilled Vegetables',
      unitPrice: 6.99,
      imagePath: 'images/menu/grilled_vegetables.jpg',
      categories: <String>['Sides'],
      description:
          "An assortment of seasonal vegetables, lightly seasoned and grilled to perfection.",
    ),
    MenuItemModel(
      name: 'Japchae (Glass Noodles)',
      unitPrice: 9.99,
      imagePath: 'images/menu/japchae.jpg',
      dropdownOptions: <String, List<String>>{
        'Add Protein': <String>['Beef', 'Chicken', 'Shrimp'],
      },
      categories: <String>['Sides'],
      description:
          "A delightful mix of glass noodles, stir-fried with vegetables and a savory-sweet soy sauce.",
    ),
    MenuItemModel(
      name: 'Kimchi',
      unitPrice: 4.99,
      imagePath: 'images/menu/kimchi.jpg',
      dropdownOptions: <String, List<String>>{
        'Fermentation Level': <String>['Fresh', 'Medium', 'Aged'],
      },
      categories: <String>['Sides'],
      description:
          "A traditional Korean side dish made from fermented napa cabbage and radishes.",
    ),

    // Drinks
    MenuItemModel(
      name: 'Barley Tea (Bori Cha)',
      unitPrice: 1.99,
      imagePath: 'images/menu/barley_tea.jpeg',
      categories: <String>['Drinks'],
      description:
          "A light and nutty traditional Korean tea served hot or cold.",
    ),
    MenuItemModel(
      name: 'Juice',
      unitPrice: 2.99,
      imagePath: 'images/menu/juice.jpg',
      dropdownOptions: <String, List<String>>{
        'Type': <String>[
          'Apple',
          'Orange',
          'Mango',
          'Peach',
          'Lychee',
          'Pineapple'
        ],
        'Ice Level': <String>['Ice', 'No Ice', 'Less Ice'],
      },
      categories: <String>['Drinks'],
      description: "Fresh Juice",
    ),
    MenuItemModel(
      name: 'Korean Pear Juice',
      unitPrice: 3.99,
      imagePath: 'images/menu/korean_pear_juice.jpg',
      categories: <String>['Drinks'],
      description: "A refreshing and sweet juice made from Korean pears.",
    ),
    MenuItemModel(
      name: 'Milkis Soda',
      unitPrice: 2.99,
      imagePath: 'images/menu/milkis_soda.jpg',
      categories: <String>['Drinks'],
      description:
          "A unique carbonated soft drink with a creamy and sweet taste.",
    ),
    MenuItemModel(
      name: 'Pop',
      unitPrice: 1.99,
      imagePath: 'images/menu/pop.jpg',
      dropdownOptions: <String, List<String>>{
        'Pop': <String>['Coca Cola', 'Sprite', 'Iced Tea', 'Lemonade'],
        'Ice Level': <String>['Ice', 'No Ice', 'Less Ice'],
      },
      categories: <String>['Drinks'],
      description: "Carbonated Fountain Drink.",
    ),
    MenuItemModel(
      name: 'Water',
      unitPrice: 0.00,
      imagePath: 'images/menu/water.jpg',
      dropdownOptions: <String, List<String>>{
        'Ice Level': <String>['Ice', 'No Ice', 'Less Ice'],
      },
      categories: <String>['Drinks'],
      description: "A Glass of water",
    ),

    // Desserts
    MenuItemModel(
      name: 'Green Tea Ice Cream',
      unitPrice: 4.99,
      imagePath: 'images/menu/green_tea_ice_cream.jpg',
      categories: <String>['Desserts'],
      defaultOptions: <String, bool>{
        'Extra Whipped Cream': true,
        'Gluten-Free': false,
        'Extra Green Tea': false,
      },
      description:
          "Creamy green tea-flavored ice cream, a refreshing way to end your meal.",
    ),
    MenuItemModel(
        name: 'Mochi Ice Cream',
        unitPrice: 6.99,
        imagePath: 'images/menu/mochi_ice_cream.jpg',
        dropdownOptions: <String, List<String>>{
          'Flavors': <String>['Matcha', 'Vanilla', 'Strawberry', 'Chocolate'],
        },
        defaultOptions: <String, bool>{
          'Extra Mochi': false,
          'Gluten-Free': true,
          'Extra Ice Cream': true,
        },
        categories: <String>['Desserts'],
        description:
            "Soft and chewy mochi filled with creamy ice cream in various flavors."),
  ];

  const menuCategories = <String>[
    'Appetizers',
    'Entrees',
    'Sides',
    'Drinks',
    'Desserts',
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
    return Consumer<ThemeProvider>(
      builder: (context, theme, child) => MaterialApp(
        title: 'Gogi Ordering Interface',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: theme.themeMode,
        home: const DefaultTabController(
          length: 6, // Number of tabs
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
