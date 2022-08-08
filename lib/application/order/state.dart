part of 'service.dart';

abstract class OrderState {}

class EmptyState extends OrderState {}

class ErrorState extends OrderState {}

class LoadedState extends OrderState {
  final List<Order> orders;
  LoadedState({required this.orders});
}

class LoadingState extends LoadedState {
  LoadingState({required List<Order> orders}) : super(orders: orders);
}

class LastPageState extends LoadedState {
  LastPageState({required List<Order> orders}) : super(orders: orders);
}
