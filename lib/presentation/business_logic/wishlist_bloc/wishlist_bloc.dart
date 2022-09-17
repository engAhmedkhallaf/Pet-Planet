import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_planet/data/models/product_model.dart';
import 'package:pet_planet/data/models/wishlist_model.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoadingState()) {
    on<WishlistStartedEvent>(_onStartWishlist);
    on<AddProductToWishlistEvent>(_onAddWishlistProduct);
    on<RemoveProductFromWishlistEvent>(_onRemoveWishlistProduct);
  }

  FutureOr<void> _onStartWishlist(event, Emitter<WishlistState> emit) async {
    emit(WishlistLoadingState());
    try {
      await Future<void>.delayed(AppDuration.d1000);
      emit(const WishlistSuccessState());
    } catch (_) {
      emit(WishlistFailureState());
    }
  }

  FutureOr<void> _onAddWishlistProduct(
      event, Emitter<WishlistState> emit) async {
    final state = this.state;
    if (state is WishlistSuccessState) {
      try {
        emit(
          WishlistSuccessState(
            wishlist: Wishlist(
              products: List.from(state.wishlist.products)..add(event.product),
            ),
          ),
        );
      } on Exception {
        emit(WishlistFailureState());
      }
    }
  }

  FutureOr<void> _onRemoveWishlistProduct(
      event, Emitter<WishlistState> emit) async {
    final state = this.state;
    if (state is WishlistSuccessState) {
      try {
        emit(WishlistSuccessState(
          wishlist: Wishlist(
            products: List.from(state.wishlist.products)..remove(event.product),
          ),
        ));
      } on Exception {
        emit(WishlistFailureState());
      }
    }
  }
}