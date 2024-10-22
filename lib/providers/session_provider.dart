import 'package:flutter/material.dart';
import 'package:gogi_ordering_interface/models/menu_item_model.dart';
import 'package:gogi_ordering_interface/models/order_item_model.dart';

class SessionProvider extends ChangeNotifier {
  SessionProvider._internalConstructor({
    required Map<MenuItemModel, OrderItemModel> currentOrder,
    required List<OrderItemModel> orderHistory
  }) :
    _currentOrder = currentOrder,
    _orderHistory = orderHistory;

  final Map<MenuItemModel, OrderItemModel> _currentOrder;
  final List<OrderItemModel> _orderHistory;

  factory SessionProvider() {
    return SessionProvider._internalConstructor(
      currentOrder: {},
      orderHistory: []
    );
  }

  void addToOrder(MenuItemModel menuItem) {
    OrderItemModel? item = _currentOrder[menuItem];

    if (item != null) {
      _currentOrder[menuItem]!.updateQuantity(1);
    }
    else {
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

  Map<MenuItemModel, OrderItemModel> get currentOrder => Map.unmodifiable(_currentOrder);
  List<OrderItemModel> get orderHistory => List.unmodifiable(_orderHistory);
}