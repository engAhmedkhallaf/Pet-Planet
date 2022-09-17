part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartLoadingState extends CartState {
  @override
  List<Object> get props => [];
}

class CartSuccessState extends CartState {
  final Cart cart;

 const CartSuccessState({this.cart = const Cart()});

  @override
  List<Object> get props => [cart,];
}

class CartFailureState extends CartState {
  @override
  List<Object> get props => [];
}
