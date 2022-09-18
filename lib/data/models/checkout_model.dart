import 'package:equatable/equatable.dart';
import 'package:pet_planet/data/models/product_model.dart';

class Checkout extends Equatable {
  final String? fullName;
  final String? email;
  final String? mobileNumber;
  final String? address;
  final String? city;
  final List<Product>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;

  const Checkout({
    required this.fullName,
    required this.email,
    required this.mobileNumber,
    required this.address,
    required this.city,
    required this.products,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
  });

  Map<String, dynamic> toDocument() {
    Map customerAddress = {};
    customerAddress['address'] = address;
    customerAddress['city'] = city;

    return {
      'customerAddress': customerAddress,
      'customerName': fullName!,
      'customerEmail': email!,
      'customerPhone': mobileNumber!,
      'products': products!.map((product) => product.name).toList(),
      'subtotal': subtotal!,
      'deliveryFee': deliveryFee!,
      'total': total!,
    };
  }

  @override
  List<Object?> get props => [
        fullName,
        email,
        address,
        city,
        mobileNumber,
        products,
        subtotal,
        deliveryFee,
        total,
      ];
}
