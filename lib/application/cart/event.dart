part of 'service.dart';

abstract class CartEvent {}

class InitEvent extends CartEvent {}

class AddEvent extends CartEvent {
  final int productId;
  AddEvent({required this.productId});
}

class RemoveEvent extends CartEvent {
  final int productId;
  RemoveEvent({required this.productId});
}

class DeleteLineEvent extends CartEvent {
  final int productId;
  DeleteLineEvent({required this.productId});
}

class CleanEvent extends CartEvent {}

class ShowSumaryEvent extends CartEvent {}

class ApplyCouponEvent extends CartEvent {}

class CompleteEvent extends CartEvent {}
