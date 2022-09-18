part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

class UpdateCheckoutEvent extends CheckoutEvent {
  final String? fullName;
  final String? email;
  final String? mobileNumber;
  final String? address;
  final String? city;
  final Cart? cart;

  const UpdateCheckoutEvent({
    this.fullName,
    this.email,
    this.mobileNumber,
    this.address,
    this.city,
    this.cart,
  });

  @override
  List<Object?> get props => [
        fullName,
        email,
        mobileNumber,
        address,
        city,
        cart,
      ];
}

class ConfirmCheckoutEvent extends CheckoutEvent {
  final Checkout checkout;

  const ConfirmCheckoutEvent({required this.checkout});

  @override
  List<Object?> get props => [
        checkout,
      ];
}
