part of 'service.dart';

abstract class CartState {}

class EmptyState extends CartState {}

class LoadingState extends CartState {}

class ErrorState extends CartState {}

class LoadedState extends CartState {
  final Cart cart;
  LoadedState(this.cart);
}
