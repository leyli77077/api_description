import 'package:flutter/foundation.dart';
import 'package:flutter_shop/domain/order.dart';
import 'package:flutter_shop/infrastructure/repository/order_repository.dart';

part 'event.dart';
part 'state.dart';

class OrderService extends ChangeNotifier {
  static OrderService instance = OrderService._internal();

  OrderService._internal();
  OrderState _state = EmptyState();
  OrderState get state => _state;

  void emit(OrderState newState) {
    _state = newState;
    notifyListeners();
  }

  int page = 1;
  final List<Order> _orders = [];

  OrderState valueChecker(List<Order> order) {
    if (order.isEmpty && _orders.isEmpty) {
      return EmptyState();
    } else if (order.isEmpty && _orders.isNotEmpty) {
      return LastPageState(orders: _orders);
    } else if (order.isNotEmpty) {
      page++;
      return LoadedState(orders: _orders..addAll(order));
    } else {
      return EmptyState();
    }
  }

  Future add(OrderEvent event) async {
    emit(LoadedState(orders: _orders));
    emit(await mapEventToState(event));
  }

  Future<OrderState> mapEventToState(OrderEvent event) async {
    if (event is InitEvent) {
      page = 1;
      var orders = await OrderRepository.orderList(page: page);
      return valueChecker(orders);
    } else if (state is LoadEvent) {
      var orders = await OrderRepository.orderList(page: page);
      return valueChecker(orders);
    } else {
      return EmptyState();
    }
  }
}
