import 'package:equatable/equatable.dart';
import 'package:pet_planet/data/models/product_model.dart';
import 'package:pet_planet/data/models/user_model.dart';

class Checkout extends Equatable {
  final UserModel? user;
  final List<Product>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;

  const Checkout({
    required this.user,
    required this.products,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
  });

  Map<String, dynamic> toDocument() {
    

    return {
      'user': user!.toDocument(),
      'products': products!.map((product) => product.name).toList(),
      'subtotal': subtotal!,
      'deliveryFee': deliveryFee!,
      'total': total!,
    };
  }

  @override
  List<Object?> get props => [
        user,
        products,
        subtotal,
        deliveryFee,
        total,
      ];
}
