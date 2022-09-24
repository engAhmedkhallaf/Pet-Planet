part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

class UpdateCheckoutEvent extends CheckoutEvent {
  final UserModel? user;
  final Cart? cart;

  const UpdateCheckoutEvent({
    this.user,
    this.cart,
  });

  @override
  List<Object?> get props => [
        user,
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
