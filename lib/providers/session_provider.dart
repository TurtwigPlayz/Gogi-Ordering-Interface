import 'package:flutter/material.dart';
import 'package:gogi_ordering_interface/models/menu_item_model.dart';
import 'package:gogi_ordering_interface/models/order_item_model.dart';

class SessionProvider extends ChangeNotifier {
  SessionProvider._internalConstructor({
    required Map<MenuItemModel, OrderItemModel> currentOrder,
    required List<OrderItemModel> orderHistory,
    required List<MenuItemModel> menuItems,
  })  : _currentOrder = currentOrder,
        _orderHistory = orderHistory,
        _menuItems = menuItems;

  final Map<MenuItemModel, OrderItemModel> _currentOrder;
  final List<OrderItemModel> _orderHistory;
  final List<MenuItemModel> _menuItems;

  factory SessionProvider(List<MenuItemModel> menuItems) {
    return SessionProvider._internalConstructor(
      currentOrder: {},
      orderHistory: [],
      menuItems: menuItems,
    );
  }

  void addToOrder(MenuItemModel menuItem) {
    if (_currentOrder[menuItem] != null) {
      _currentOrder[menuItem]!.updateQuantity(1);
    } else {
      _currentOrder[menuItem] = OrderItemModel(menuItem);
    }

    notifyListeners();
  }

  void removeFromOrder(MenuItemModel menuItem) {
    _currentOrder.remove(menuItem);

    notifyListeners();
  }

  void moveOrderToHistory() {
    _orderHistory.addAll(_currentOrder.values);
    _currentOrder.clear();

    notifyListeners();
  }

  Map<MenuItemModel, OrderItemModel> get currentOrder =>
      Map.unmodifiable(_currentOrder);
  List<OrderItemModel> get orderHistory => List.unmodifiable(_orderHistory);
  List<MenuItemModel> get menuItems => List.unmodifiable(_menuItems);

  double get orderTotalCost =>
      _currentOrder.values.fold(0, (acc, orderItem) => acc + orderItem.cost);
  double get currentTotalCost =>
      _orderHistory.fold(0, (acc, historicalItem) => acc + historicalItem.cost);
}
