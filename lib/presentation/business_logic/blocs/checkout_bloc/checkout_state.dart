part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

class CheckoutLoadingState extends CheckoutState {}

class CheckoutSuccessState extends CheckoutState {
  final String? fullName;
  final String? email;
  final String? mobileNumber;
  final String? address;
  final String? city;
  final List<Product>? products;
  final String? subTotal;
  final String? deliveryFee;
  final String? total;

  final Checkout checkout;

  CheckoutSuccessState({
    this.fullName,
    this.email,
    this.mobileNumber,
    this.address,
    this.city,
    this.products,
    this.subTotal,
    this.deliveryFee,
    this.total,
  }) : checkout = Checkout(
          fullName: fullName,
          email: email,
          mobileNumber: mobileNumber,
          address: address,
          city: city,
          products: products,
          subtotal: subTotal,
          deliveryFee: deliveryFee,
          total: total,
        );
  @override
  List<Object?> get props => [
        fullName,
        email,
        mobileNumber,
        address,
        city,
        products,
        subTotal,
        deliveryFee,
        total,
      ];
}

class CheckoutFailureState extends CheckoutState {}
