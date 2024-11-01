import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: TabBarView(
        children: List.generate(5, (index) => _buildMenuPageMaker(context)),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final String price;

  const MenuItem({
    required this.imagePath,
    required this.name,
    required this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name, style: const TextStyle(fontSize: 16.0)),
                  Text(price, style: const TextStyle(fontSize: 16.0)),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 8,
          right: 8,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.add, color: Colors.green),
              onPressed: () {
                // Add your onPressed logic here
              },
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildMenuPageMaker(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 items per row
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.75,
      ),
      itemCount: 4, // 4 items per page
      itemBuilder: (context, index) {
        return MenuItem(
          imagePath: 'lib/images/food_item_$index.png', // Sample image path
          name: 'Food Item $index', // Replace with actual item name
          price: '\$${(10 + index * 2).toStringAsFixed(2)}', // Sample price
        );
      },
    ),
  );
}