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
        dropdownOptions: <String, List<String>>{
          'Cooking Style': <String>['Grilled', 'Fried', 'Roasted'],
          'Sauce': <String>['Soy Garlic', 'Spicy', 'Sweet and Sour'],
        },
        categories: <String>['Entrees'],
        description:
            "Succulent, tender pork belly slow-cooked to perfection, with a crispy, caramelized outer layer and a melt-in-your-mouth interior. Marinated in a savory blend of soy sauce, garlic, and spices, each bite bursts with rich, smoky flavors. Served with a side of fresh vegetables or pickled radish to balance the richness, this dish is a comforting classic that's perfect for sharing or as a hearty main course. Enjoy it with a dipping sauce or wrapped in lettuce for a traditional experience."),
    MenuItemModel(
        name: 'Kimchi',
        unitPrice: 4.99,
        imagePath: 'images/menu/kimchi.jpg',
        dropdownOptions: <String, List<String>>{
          'Fermentation Level': <String>['Fresh', 'Medium', 'Aged'],
        },
        defaultOptions: <String, bool>{
          'Extra Garlic': false,
          'Add Sesame Seeds': false,
        },
        categories: <String>['Sides'],
        description:
            "A traditional Korean side dish made from fermented napa cabbage and radishes, seasoned with a bold blend of garlic, ginger, chili flakes, and fish sauce. Kimchi has a tangy, spicy flavor with a subtle hint of sweetness, offering a unique balance of flavors that complement many dishes. Known for its health benefits, including probiotics and essential vitamins, Kimchi adds a zesty kick to your meal. Enjoy it on its own or as a perfect side to rice, noodles, or grilled meats."),
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
            "Juicy, tender beef short ribs marinated in a rich and savory sauce, perfect for grilling. This Korean BBQ classic offers a burst of flavors with hints of sweetness, garlic, and smokiness."),
    MenuItemModel(
        name: 'Spicy Pork Bulgogi',
        unitPrice: 13.99,
        imagePath: 'images/menu/spicy_pork_bulgogi.jpg',
        dropdownOptions: <String, List<String>>{
          'Spice Level': <String>['Mild', 'Medium', 'Hot'],
        },
        categories: <String>['Entrees'],
        description:
            "Sliced pork marinated in a fiery blend of chili paste, garlic, and sesame oil. Packed with bold, spicy flavors, it's a favorite for spice lovers."),
    MenuItemModel(
        name: 'Soy Garlic Chicken',
        unitPrice: 14.99,
        imagePath: 'images/menu/soy_garlic_chicken.jpg',
        dropdownOptions: <String, List<String>>{
          'Cooking Style': <String>['Grilled', 'Fried'],
        },
        categories: <String>['Entrees'],
        description:
            "Tender chicken pieces coated in a sweet and savory soy garlic glaze. Perfectly balanced with a touch of crispiness."),
    MenuItemModel(
        name: 'Japchae (Glass Noodles)',
        unitPrice: 9.99,
        imagePath: 'images/menu/japchae.jpg',
        dropdownOptions: <String, List<String>>{
          'Add Protein': <String>['Beef', 'Chicken', 'Shrimp'],
        },
        categories: <String>['Sides'],
        description:
            "A delightful mix of glass noodles, stir-fried with vegetables and a savory-sweet soy sauce, offering a chewy texture and rich flavor."),
    MenuItemModel(
        name: 'Steamed Rice',
        unitPrice: 2.50,
        imagePath: 'images/menu/steamed_rice.jpg',
        categories: <String>['Sides'],
        description:
            "Fluffy and aromatic steamed rice, a perfect base for any meal."),
    MenuItemModel(
        name: 'Kimchi Fried Rice',
        unitPrice: 7.99,
        imagePath: 'images/menu/kimchi_fried_rice.jpg',
        dropdownOptions: <String, List<String>>{
          'Add Protein': <String>['Egg', 'Beef', 'Chicken', 'Shrimp'],
        },
        categories: <String>['Sides'],
        description:
            "Savory fried rice mixed with spicy kimchi, creating a delightful blend of tangy and spicy flavors."),
    MenuItemModel(
        name: 'Lettuce Wraps',
        unitPrice: 3.99,
        imagePath: 'images/menu/lettuce_wraps.jpg',
        categories: <String>['Sides'],
        description:
            "Fresh, crisp lettuce leaves, perfect for wrapping your grilled meats or veggies."),
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
            "A colorful medley of vegetables, rice, and protein topped with a fried egg and spicy gochujang sauce."),
    MenuItemModel(
        name: 'Seafood Pancake',
        unitPrice: 10.99,
        imagePath: 'images/menu/seafood_pancake.jpg',
        categories: <String>['Appetizers'],
        description:
            "A savory pancake filled with fresh seafood and green onions, served with a soy-based dipping sauce."),
    MenuItemModel(
        name: 'Tteokbokki',
        unitPrice: 7.99,
        imagePath: 'images/menu/tteokbokki.jpg',
        dropdownOptions: <String, List<String>>{
          'Spice Level': <String>['Mild', 'Medium', 'Hot'],
        },
        categories: <String>['Appetizers'],
        description:
            "Chewy rice cakes cooked in a sweet and spicy sauce, accompanied by fish cakes and boiled eggs."),
    MenuItemModel(
        name: 'Miso Soup',
        unitPrice: 3.99,
        imagePath: 'images/menu/miso_soup.jpg',
        categories: <String>['Sides'],
        description:
            "A warm, umami-rich soup with tofu, seaweed, and green onions."),
    MenuItemModel(
        name: 'Grilled Eel (Unagi)',
        unitPrice: 15.99,
        imagePath: 'images/menu/unagi.jpg',
        categories: <String>['Entrees'],
        description:
            "Tender grilled eel glazed with a sweet soy sauce, offering a unique and rich flavor."),
    MenuItemModel(
        name: 'Pickled Radish',
        unitPrice: 2.99,
        imagePath: 'images/menu/pickled_radish.jpg',
        categories: <String>['Sides'],
        description:
            "Crunchy and tangy pickled radish, a refreshing palate cleanser."),
    MenuItemModel(
        name: 'Egg Custard',
        unitPrice: 4.99,
        imagePath: 'images/menu/egg_custard.jpg',
        categories: <String>['Sides'],
        description:
            "A light and savory steamed egg custard, perfect as a side dish."),
    MenuItemModel(
        name: 'Grilled Vegetables',
        unitPrice: 6.99,
        imagePath: 'images/menu/grilled_vegetables.jpg',
        categories: <String>['Sides'],
        description:
            "An assortment of seasonal vegetables, lightly seasoned and grilled to perfection."),
    MenuItemModel(
        name: 'Beef Brisket',
        unitPrice: 16.99,
        imagePath: 'images/menu/beef_brisket.jpg',
        dropdownOptions: <String, List<String>>{
          'Cooking Style': <String>['Grilled', 'Charcoal'],
          'Sauce': <String>['Soy Garlic', 'Spicy', 'Sweet BBQ'],
        },
        categories: <String>['Entrees'],
        description:
            "Thinly sliced beef brisket, lightly seasoned and ready for grilling, offering a melt-in-your-mouth texture."),
    MenuItemModel(
        name: 'Garlic Shrimp',
        unitPrice: 13.99,
        imagePath: 'images/menu/garlic_shrimp.jpg',
        dropdownOptions: <String, List<String>>{
          'Cooking Style': <String>['Grilled', 'Pan-Fried'],
        },
        categories: <String>['Entrees'],
        description:
            "Juicy shrimp marinated in garlic and herbs, delivering a burst of flavor with every bite."),
    MenuItemModel(
        name: 'Sweet Potato Fries',
        unitPrice: 5.99,
        imagePath: 'images/menu/sweet_potato_fries.jpg',
        categories: <String>['Appetizers'],
        description:
            "Crispy, golden sweet potato fries with a hint of sweetness, perfect as a snack or side."),
    MenuItemModel(
        name: 'Green Tea Ice Cream',
        unitPrice: 4.99,
        imagePath: 'images/menu/green_tea_ice_cream.jpg',
        categories: <String>['Desserts'],
        description:
            "Creamy green tea-flavored ice cream, a refreshing way to end your meal."),
    MenuItemModel(
        name: 'Mochi Ice Cream',
        unitPrice: 6.99,
        imagePath: 'images/menu/mochi_ice_cream.jpg',
        dropdownOptions: <String, List<String>>{
          'Flavors': <String>['Matcha', 'Vanilla', 'Strawberry', 'Chocolate'],
        },
        categories: <String>['Desserts'],
        description:
            "Soft and chewy mochi filled with creamy ice cream in various flavors."),
    MenuItemModel(
        name: 'Korean Pear Juice',
        unitPrice: 3.99,
        imagePath: 'images/menu/korean_pear_juice.jpg',
        categories: <String>['Drinks'],
        description:
            "A refreshing and sweet juice made from Korean pears, known for their crisp flavor and hydrating qualities."),
    MenuItemModel(
        name: 'Milkis Soda',
        unitPrice: 2.99,
        imagePath: 'images/menu/milkis.jpg',
        categories: <String>['Drinks'],
        description:
            "A unique carbonated soft drink with a creamy and sweet taste, combining the lightness of soda with a milky finish."),
    MenuItemModel(
        name: 'Barley Tea (Bori Cha)',
        unitPrice: 1.99,
        imagePath: 'images/menu/barley_tea.jpg',
        categories: <String>['Drinks'],
        description:
            "A light and nutty traditional Korean tea served hot or cold, offering a caffeine-free and soothing beverage option."),
    MenuItemModel(
        name: 'Pop',
        unitPrice: 1.99,
        imagePath: 'images/menu/barley_tea.jpg',
        dropdownOptions: <String, List<String>>{
          'Pop': <String>['Coca Cola', 'Sprite', 'Iced Tea', 'Lemonade'],
          'Ice Level': <String>['Ice', 'No Ice', 'Less Ice'],
        },
        categories: <String>['Drinks'],
        description: "Fountain Drink."),
    MenuItemModel(
        name: 'Juice',
        unitPrice: 2.99,
        imagePath: 'images/menu/barley_tea.jpg',
        dropdownOptions: <String, List<String>>{
          'Juice': <String>[
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
        description: "Fresh Juice"),
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
