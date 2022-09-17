part of 'wishlist_bloc.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  
}

class WishlistStartedEvent extends WishlistEvent {
  @override
  List<Object> get props => [];
}

class AddProductToWishlistEvent extends WishlistEvent {
  final Product product;

  const AddProductToWishlistEvent(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveProductFromWishlistEvent extends WishlistEvent {
  final Product product;

  const RemoveProductFromWishlistEvent(this.product);

  @override
  List<Object> get props => [product];
}
