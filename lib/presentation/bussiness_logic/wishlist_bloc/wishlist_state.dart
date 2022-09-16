part of 'wishlist_bloc.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object> get props => [];
}

class WishlistLoadingState extends WishlistState {}

class WishlistSuccessState extends WishlistState {
  final Wishlist wishlist;

  const WishlistSuccessState({this.wishlist = const Wishlist()});
  @override
  List<Object> get props => [wishlist];
}

class WishlistFailureState extends WishlistState {}
