import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_planet/data/models/product_model.dart';
import 'package:pet_planet/data/repositories/product/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;

  ProductBloc({
    required ProductRepository productRepository,
  })  : _productRepository = productRepository,
        super(ProductLoadingState()) {
    on<StartProductEvent>(_onLoadingProducts);
    on<UpdateProductsEvent>(_onUpdateProducts);
  }

  FutureOr<void> _onLoadingProducts(
      StartProductEvent event, Emitter<ProductState> emit) async {
    _productSubscription?.cancel();
    _productSubscription = _productRepository.getAllProducts().listen(
          (products) => add(
            UpdateProductsEvent(products),
          ),
        );
  }

  FutureOr<void> _onUpdateProducts(
      UpdateProductsEvent event, Emitter<ProductState> emit) async {
    emit(ProductSuccessState(products: event.products));
  }
}
