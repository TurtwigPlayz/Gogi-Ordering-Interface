import 'package:flutter/material.dart';
import 'package:gogi_ordering_interface/theme_data.dart';
import 'package:gogi_ordering_interface/widgets/inkwell_button.dart';
import 'package:gogi_ordering_interface/widgets/tagged_text.dart';

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
  MenuItemDetailState createState() => MenuItemDetailState();
}

class MenuItemDetailState extends State<MenuItemDetail> {
  final double borderRadius = 12.0;

  int quantity = 1;
  String selectedSpiceLevel = 'Medium';
  final List<String> spiceLevels = ['Mild', 'Medium', 'Hot'];
  bool extraCheese = false;
  bool addSauce = false;

  Widget _buildCustomizationOption(
      String title, bool value, Function(bool?) onChanged) {
    return CheckboxListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      value: value,
      onChanged: onChanged,
      fillColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return greenColor;
          }
          return null;
        },
      ),
      checkColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
          style:
              Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20.0),
        ),
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
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 18.0),
            ),
            const SizedBox(height: 8.0),
            Align(
              alignment: Alignment.centerLeft,
              child: TaggedText(
                text: widget.price,
                backgroundColor: greenColor,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              widget.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24.0),

            // Customization Options
            Text(
              'Choose Spice Level',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            DropdownButton<String>(
              borderRadius: BorderRadius.circular(borderRadius),
              value: selectedSpiceLevel,
              items: spiceLevels.map((size) {
                return DropdownMenuItem(
                  value: size,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(size,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
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
            _buildCustomizationOption(
              'Extra Cheese',
              extraCheese,
              (value) {
                setState(() {
                  extraCheese = value!;
                });
              },
            ),
            _buildCustomizationOption(
              'Add Sauce',
              addSauce,
              (value) {
                setState(() {
                  addSauce = value!;
                });
              },
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Quantity",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
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
            InkwellButton(
              onTap: () {
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
              title: "Add to Order",
            ),
          ],
        ),
      ),
    );
  }
}
