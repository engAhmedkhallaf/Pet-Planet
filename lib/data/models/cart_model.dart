import 'package:equatable/equatable.dart';
import 'package:pet_planet/data/models/product_model.dart';

class Cart extends Equatable {
  final List<Product> products;
  const Cart({this.products = const <Product>[]});

// To check if the product is already exist or not
  Map productQuantity(products) {
    var quantity = {};

    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });
    return quantity;
  }

// To Get THE SUBTOTAL PRICE
  double get subTotal =>
      products.fold(0, (total, current) => total + current.price);

// CALCUALTION THE DELIVERY FEE
  double deliveryFee(subTotal) {
    if (subTotal >= 30) {
      return 0.0;
    } else {
      return 10.0;
    }
  }

// Return Phrase to client based on whole Subtotal Price
  String freeDelevery(subTotal) {
    if (subTotal >= 30) {
      return 'You have Free Delivery';
    } else {
      double missing = 30.0 - subTotal;
      return 'Add \$${missing.toStringAsFixed(2)} Free Delivery';
    }
  }

// CALCUALTION THE TOTAL
  double total(subTotal, deliveryFee) {
    return subTotal + deliveryFee(subTotal);
  }

  String get subTotalString => subTotal.toStringAsFixed(2);
  String get deliveryFeeString => deliveryFee(subTotal).toStringAsFixed(2);
  String get freeDeliveryString => freeDelevery(subTotal);
  String get totalString => total(subTotal, deliveryFee).toStringAsFixed(2);

  @override
  List<Object?> get props => [
        products,
      ];
}
