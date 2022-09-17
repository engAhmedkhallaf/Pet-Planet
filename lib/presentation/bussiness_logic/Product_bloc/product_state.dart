part of 'product_bloc.dart';


abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductLoadingState extends ProductState {}

class ProductSuccessState extends ProductState {
  final List<Product> products;

  const ProductSuccessState({this.products = const <Product>[]});

  @override
  List<Object> get props => [
        products,
      ];
}

