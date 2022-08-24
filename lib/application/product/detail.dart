import 'package:flutter/foundation.dart';
import '../../domain/product/product_detail.dart';
import '../../infrastructure/repository/product_repository.dart';

abstract class DetailState {}

class LoadingState extends DetailState {}

class ErrorState extends DetailState {}

class LoadedState extends DetailState {
  final ProductDetail detail;
  LoadedState(this.detail);
}

class ProductDetailService extends ChangeNotifier {
  // static ProductDetailService instance = ProductDetailService._internal();

  // ProductDetailService._internal();
  // factory ProductDetailService() => instance;
  DetailState state = LoadingState();

  void emit(DetailState state) {
    this.state = state;
    notifyListeners();
  }

  void load(int id) async {
    emit(LoadingState());
    try {
      emit(LoadedState(await ProductRepository.loadProductDetail(id)));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
