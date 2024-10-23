import 'dart:math';
import 'menu_item_model.dart';

class OrderItemModel {
  OrderItemModel._internalConstructor({
    required MenuItemModel menuItem,
    required int quantity,
    required Map<String, bool> options,
  }) :
    _options = options,
    _quantity = quantity,
    _menuItem = menuItem;

  final MenuItemModel _menuItem;
  int _quantity;
  Map<String, bool> _options;

  MenuItemModel get menuItem => _menuItem;
  int get quantity => _quantity;
  Map<String, bool> get options => _options;

  double get cost => _quantity * _menuItem.unitPrice;

  void updateQuantity(int amount) {
    _quantity = max(0, _quantity + amount);
  }

  factory OrderItemModel(MenuItemModel menuItem) {
    return OrderItemModel._internalConstructor(
      menuItem: menuItem,
      quantity: menuItem.defaultUnits,
      options: Map.from(menuItem.defaultOptions), // Copy the default options
    );
  }
}