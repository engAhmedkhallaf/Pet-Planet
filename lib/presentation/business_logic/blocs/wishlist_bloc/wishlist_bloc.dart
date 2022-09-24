import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:pet_planet/data/models/product_model.dart';
import 'package:pet_planet/data/models/wishlist_model.dart';
import 'package:pet_planet/data/repositories/local_storage/local_storage_repository.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final LocalStorageRepository _localStorageRepository;
  WishlistBloc({required LocalStorageRepository localStorageRepository})
      : _localStorageRepository = localStorageRepository,
        super(WishlistLoadingState()) {
    on<WishlistStartedEvent>(_onStartWishlist);
    on<AddProductToWishlistEvent>(_onAddWishlistProduct);
    on<RemoveProductFromWishlistEvent>(_onRemoveWishlistProduct);
  }

  FutureOr<void> _onStartWishlist(event, Emitter<WishlistState> emit) async {
    emit(WishlistLoadingState());
    try {
      Box box = await _localStorageRepository.openBox();
      List<Product> products = _localStorageRepository.getWishlist(box);

      await Future<void>.delayed(AppDuration.d1000);
      emit(
        WishlistSuccessState(
          wishlist: Wishlist(
            products: products,
          ),
        ),
      );
    } catch (e) {
      emit(WishlistFailureState());
    }
  }

  FutureOr<void> _onAddWishlistProduct(
      event, Emitter<WishlistState> emit) async {
    final state = this.state;
    if (state is WishlistSuccessState) {
      try {
        Box box = await _localStorageRepository.openBox();
        _localStorageRepository.addProductToWishlist(box, event.product);
        emit(
          WishlistSuccessState(
            wishlist: Wishlist(
              products: List.from(state.wishlist.products)..add(event.product),
            ),
          ),
        );
      } catch (e) {
        emit(WishlistFailureState());
      }
    }
  }

  FutureOr<void> _onRemoveWishlistProduct(
      event, Emitter<WishlistState> emit) async {
    final state = this.state;
    if (state is WishlistSuccessState) {
      try {
        Box box = await _localStorageRepository.openBox();
        _localStorageRepository.removeProductFromWishlist(box, event.product);

        emit(WishlistSuccessState(
          wishlist: Wishlist(
            products: List.from(state.wishlist.products)..remove(event.product),
          ),
        ));
      } catch (e) {
        emit(WishlistFailureState());
      }
    }
  }
}
