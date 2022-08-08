part of 'service.dart';

abstract class FavoriteEvent {}

class InitEvent extends FavoriteEvent {}

class LoadEvent extends FavoriteEvent {}

class AddEvent extends FavoriteEvent {
  final int id;
  AddEvent({required this.id});
}
