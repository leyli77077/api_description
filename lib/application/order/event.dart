part of 'service.dart';

abstract class OrderEvent {}

class InitEvent extends OrderEvent {}

class LoadEvent extends OrderEvent {}
