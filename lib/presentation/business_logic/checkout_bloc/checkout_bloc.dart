import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_planet/data/models/cart_model.dart';
import 'package:pet_planet/data/models/checkout_model.dart';
import 'package:pet_planet/data/models/product_model.dart';
import 'package:pet_planet/data/repositories/checkout/checkout_repository.dart';
import 'package:pet_planet/presentation/business_logic/cart_bloc/cart_bloc.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc _cartBloc;
  final CheckoutRepository _checkoutRepository;
  StreamSubscription? _cartSubscription;
  StreamSubscription? _checkoutSubscription;

  CheckoutBloc({
    required CartBloc cartBloc,
    required CheckoutRepository checkoutRepository,
  })  : _cartBloc = cartBloc,
        _checkoutRepository = checkoutRepository,
        super(
          cartBloc.state is CartSuccessState
              ? CheckoutSuccessState(
                  products: (cartBloc.state as CartSuccessState).cart.products,
                  subTotal:
                      (cartBloc.state as CartSuccessState).cart.subTotalString,
                  deliveryFee: (cartBloc.state as CartSuccessState)
                      .cart
                      .deliveryFeeString,
                  total: (cartBloc.state as CartSuccessState).cart.totalString,
                )
              : CheckoutLoadingState(),
        ) {
    on<UpdateCheckoutEvent>(_onUpdateCheckout);
    on<ConfirmCheckoutEvent>(_onConfirmCheckout);

    _cartSubscription = _cartBloc.stream.listen((state) {
      if (state is CartSuccessState) {
        add(
          UpdateCheckoutEvent(cart: state.cart),
        );
      }
    });
  }

  FutureOr<void> _onUpdateCheckout(
      UpdateCheckoutEvent event, Emitter<CheckoutState> emit) {
    final state = this.state;
    if (state is CheckoutSuccessState) {
      emit(
        CheckoutSuccessState(
          fullName: event.fullName ?? state.fullName,
          email: event.email ?? state.email,
          mobileNumber: event.mobileNumber ?? state.mobileNumber,
          products: event.cart?.products ?? state.products,
          deliveryFee: event.cart?.deliveryFeeString ?? state.deliveryFee,
          subTotal: event.cart?.subTotalString ?? state.subTotal,
          total: event.cart?.totalString ?? state.total,
          address: event.address ?? state.address,
          city: event.city ?? state.city,
        ),
      );
    }
  }

  FutureOr<void> _onConfirmCheckout(
      ConfirmCheckoutEvent event, Emitter<CheckoutState> emit) async {
    _checkoutSubscription?.cancel();
    if (state is CheckoutSuccessState) {
      try {
        await _checkoutRepository.addCheckout(event.checkout);
        emit(CheckoutSuccessState());
        _cartBloc.add( CartStartedEvent());
      } catch (_) {
        emit(CheckoutFailureState());
      }
    }
  }
}
