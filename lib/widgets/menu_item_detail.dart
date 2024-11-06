// menu_item_detail_page.dart
import 'package:flutter/material.dart';
import 'package:gogi_ordering_interface/theme_data.dart';
import 'package:gogi_ordering_interface/widgets/tagged_text.dart';
import 'package:gogi_ordering_interface/providers/session_provider.dart';
import 'package:provider/provider.dart';

class MenuItemDetail extends StatefulWidget {
  final String imagePath;
  final String name;
  final String price;
  final String description;

  const MenuItemDetail({
    required this.imagePath,
    required this.name,
    required this.price,
    required this.description,
    super.key,
  });

  @override
  _MenuItemDetailState createState() => _MenuItemDetailState();
}

class _MenuItemDetailState extends State<MenuItemDetail> {
  int quantity = 1;
  String selectedSpiceLevel = 'Medium';
  final List<String> spiceLevels = ['Mild', 'Medium', 'Hot'];
  bool extraCheese = false;
  bool addSauce = false;

  @override
  Widget build(BuildContext context) {
    final session = Provider.of<SessionProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                widget.imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250.0,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              widget.name,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8.0),
            TaggedText(
              text: widget.price,
              backgroundColor: greenColor,
            ),
            const SizedBox(height: 16.0),
            Text(
              widget.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24.0),

            // Customization Options
            Text(
              'Choose Spice Level',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            DropdownButton<String>(
              value: selectedSpiceLevel,
              items: spiceLevels.map((size) {
                return DropdownMenuItem(
                  value: size,
                  child: Text(size),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedSpiceLevel = newValue!;
                });
              },
            ),

            const SizedBox(height: 16.0),

            // Toppings/Extras Options
            CheckboxListTile(
              title: const Text("Extra Cheese"),
              value: extraCheese,
              onChanged: (value) {
                setState(() {
                  extraCheese = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text("Add Sauce"),
              value: addSauce,
              onChanged: (value) {
                setState(() {
                  addSauce = value!;
                });
              },
            ),

            const SizedBox(height: 16.0),

            // Quantity Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text("Quantity"),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity--;
                          });
                        }
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text(quantity.toString()),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),

            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Add item to order with customizations
                // session.addItemToOrder(
                //   widget.name,
                //   widget.price,
                //   quantity: quantity,
                //   size: selectedSpiceLevel,
                //   extras: {
                //     'Extra Cheese': extraCheese,
                //     'Add Sauce': addSauce,
                //   },
                // );
                Navigator.pop(context); // Return to the previous page
              },
              child: const Text("Add to Order"),
            ),
          ],
        ),
      ),
    );
  }
}
