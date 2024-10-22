import 'package:flutter/material.dart';
import 'package:gogi_ordering_interface/models/order_item_model.dart';

class SessionProvider extends ChangeNotifier {
  SessionProvider({
    List<OrderItemModel> currentOrder = const <OrderItemModel>[],
    List<OrderItemModel> orderHistory = const <OrderItemModel>[],
  }) :
    _currentOrder = currentOrder,
    _orderHistory = orderHistory;

  final List<OrderItemModel> _currentOrder;
  final List<OrderItemModel> _orderHistory;

  void addToOrder(OrderItemModel orderItem) {
    _currentOrder.add(orderItem);

    notifyListeners();
  }

  void moveOrderToHistory() {
    _orderHistory.addAll(_currentOrder);
    _currentOrder.clear();

    notifyListeners();
  }

  List<OrderItemModel> get currentOrder => List.unmodifiable(_currentOrder);
  List<OrderItemModel> get orderHistory => List.unmodifiable(_orderHistory);
}