part of 'service.dart';

class EmptyState extends HomePageState {}

class LoadingState extends HomePageState {}

class ErrorState extends HomePageState {
  final String? message;
  ErrorState({this.message});
}
