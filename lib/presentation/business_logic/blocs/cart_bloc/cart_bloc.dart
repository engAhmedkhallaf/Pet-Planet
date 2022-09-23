import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_planet/data/models/cart_model.dart';
import 'package:pet_planet/data/models/product_model.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoadingState()) {
    on<CartStartedEvent>(_onCartLoading);
    on<AddProductToCartEvent>(_onAddProductToCart);
    on<RemoveProductFromCartEvent>(_onRemoveProductFromCart);
  }

  FutureOr<void> _onCartLoading(
      CartStartedEvent event, Emitter<CartState> emit) async {
    emit(CartLoadingState());
    try {
      await Future<void>.delayed(AppDuration.d1000);
      emit(const CartSuccessState());
    } catch (_) {
      emit(CartFailureState());
    }
  }

  FutureOr<void> _onAddProductToCart(
      AddProductToCartEvent event, Emitter<CartState> emit) async {
    final state = this.state;
    if (state is CartSuccessState) {
      try {
        emit(
          CartSuccessState(
            cart: Cart(
              products: List.from(state.cart.products)..add(event.product),
            ),
          ),
        );
      } catch (_) {
        emit(CartFailureState());
      }
    }
  }

  FutureOr<void> _onRemoveProductFromCart(
      RemoveProductFromCartEvent event, Emitter<CartState> emit) async {
        final state = this.state;
    if (state is CartSuccessState) {
      try {
        emit(
          CartSuccessState(
            cart: Cart(
              products: List.from(state.cart.products)..remove(event.product),
            ),
          ),
        );
      } catch (_) {
        emit(CartFailureState());
      }
    }
      }
}
