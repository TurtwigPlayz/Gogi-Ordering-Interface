import 'package:flutter/material.dart';
import 'package:gogi_ordering_interface/theme_data.dart';
import 'package:gogi_ordering_interface/widgets/icon_inkwell_button.dart';
import 'package:gogi_ordering_interface/widgets/tagged_text.dart';
import 'package:gogi_ordering_interface/widgets/menu_item_detail.dart';

class MenuItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final String price;
  final String description;

  const MenuItem({
    required this.imagePath,
    required this.name,
    required this.price,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MenuItemDetail(
                imagePath: imagePath,
                name: name,
                price: price,
                description: description,
              ),
            ),
          );
        },
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Stack(
                      children: <Widget>[
                        Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                        // Add your overlay elements here
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            color: Theme.of(context)
                                .scaffoldBackgroundColor
                                .withOpacity(0.8),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  name,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const SizedBox(width: 10.0),
                                TaggedText(
                                  text: price,
                                  backgroundColor: greenColor,
                                ),
                                const Expanded(child: SizedBox()),
                                ColorFiltered(
                                  colorFilter: const ColorFilter.matrix([
                                    -1, 0, 0, 0, 255, // Red
                                    0, -1, 0, 0, 255, // Green
                                    0, 0, -1, 0, 255, // Blue
                                    0, 0, 0, 1, 0, // Alpha
                                  ]),
                                  child: IconInkwellButton(
                                    onTap: () => {},
                                    icon: Icons.add,
                                    iconSize: 22,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
