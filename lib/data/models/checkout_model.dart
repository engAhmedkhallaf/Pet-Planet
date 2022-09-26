import 'package:equatable/equatable.dart';
import 'package:pet_planet/core/app/app_constants.dart';
import 'package:pet_planet/core/network/local/cache_helper.dart';
import 'package:pet_planet/data/models/product_model.dart';
import 'package:pet_planet/data/models/user_model.dart';

class Checkout extends Equatable {
  final UserModel? user;
  final String? customerId;
  final List<Product>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;
  final DateTime? createdAt;
  final bool? isAccepted;
  final bool? isCancelled;
  final bool? isDelivered;

  const Checkout({
    required this.user,
    required this.products,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
    this.customerId,
    this.createdAt,
    this.isAccepted,
    this.isCancelled,
    this.isDelivered,
  });

  Map<String, dynamic> toDocument() {
    return {
      'user': user!.toDocument(),
      'customerId': customerId ?? CacheHelper.get(key: AppConstants.uidKey),
      'products': products!.map((product) => product.id).toList(),
      'subtotal': subtotal!,
      'deliveryFee': deliveryFee!,
      'total': total!,
      'createdAt': DateTime.now(),
      'isAccepted': false,
      'isCancelled': false,
      'isDelivered': false,
    };
  }

  @override
  List<Object?> get props => [
        user,
        products,
        subtotal,
        deliveryFee,
        total,
        createdAt,
        isAccepted,
        isCancelled,
        isDelivered,
      ];
}
