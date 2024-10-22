import 'menu_item_model.dart';

class OrderItemModel {
  OrderItemModel._internalConstructor({
    required this.menuItem,
    required this.quantity,
    required this.options,
  });

  final MenuItemModel menuItem;
  int quantity;
  Map<String, bool> options;

  factory OrderItemModel(MenuItemModel menuItem) {
    return OrderItemModel._internalConstructor(
      menuItem: menuItem,
      quantity: menuItem.defaultUnits,
      options: Map.from(menuItem.defaultOptions), // Copy the default options
    );
  }
}