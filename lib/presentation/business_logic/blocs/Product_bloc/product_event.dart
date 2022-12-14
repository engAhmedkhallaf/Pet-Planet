part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class StartProductEvent extends ProductEvent {}

class UpdateProductsEvent extends ProductEvent {
  final List<Product> products;

  const UpdateProductsEvent(this.products);

  @override
  List<Object> get props => [products];
}
