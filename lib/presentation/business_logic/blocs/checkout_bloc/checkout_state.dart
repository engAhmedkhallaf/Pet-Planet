part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

class CheckoutLoadingState extends CheckoutState {}

class CheckoutSuccessState extends CheckoutState {
  final UserModel? user;
  final String? customerId;
  final List<Product>? products;
  final String? subTotal;
  final String? deliveryFee;
  final String? total;

  final Checkout checkout;

  CheckoutSuccessState({
     this.user,
    this.customerId,
    this.products,
    this.subTotal,
    this.deliveryFee,
    this.total,
  }) : checkout = Checkout(
          user: user,
          customerId: customerId,
          products: products,
          subtotal: subTotal,
          deliveryFee: deliveryFee,
          total: total,
        );
  @override
  List<Object?> get props => [
        user,
        customerId,
        products,
        subTotal,
        deliveryFee,
        total,
      ];
}

class CheckoutFailureState extends CheckoutState {}
