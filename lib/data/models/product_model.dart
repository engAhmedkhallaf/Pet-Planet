import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:pet_planet/presentation/resources/assets/assets_manager.dart';
part 'product_model.g.dart';

@HiveType(typeId: 0)
class Product extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String category;
  @HiveField(4)
  final String imageUrl;
  @HiveField(5)
  final double price;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.price,
  });

  static Product fromSnapshot(DocumentSnapshot snapshot) {
    Product product = Product(
      id: snapshot.id ,
      name: snapshot['name'] ?? 'No name',
      description: snapshot['description'] ?? 'No Description',
      category: snapshot['category'] ?? 'No name',
      imageUrl: snapshot['imageUrl'] ?? AssetsManager.noImageUrl,
      price: snapshot['price'].toDouble(),
    );
    return product;
  }

  // static List<Product> productList = const [
  //   Product(
  //     name: 'Soft Drink #1',
  //     description:
  //         'Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description ',
  //     category: 'Food',
  //     imageUrl:
  //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8HF9WbEG8AH5wFdNDjNKemyMWfZT-sEC6Ht-sMqvystVw8_6uxqEwtFJIWbXm11J5VkQ&usqp=CAU',
  //     price: 200.0,
  //   ),
  //   Product(
  //     name: 'Drink #2',
  //     description:
  //         'Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description ',
  //     category: 'Food',
  //     imageUrl:
  //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8HF9WbEG8AH5wFdNDjNKemyMWfZT-sEC6Ht-sMqvystVw8_6uxqEwtFJIWbXm11J5VkQ&usqp=CAU',
  //     price: 50.0,
  //   ),
  //   Product(
  //     name: 'Hi #3',
  //     description:
  //         'Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description ',
  //     category: 'Food',
  //     imageUrl:
  //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8HF9WbEG8AH5wFdNDjNKemyMWfZT-sEC6Ht-sMqvystVw8_6uxqEwtFJIWbXm11J5VkQ&usqp=CAU',
  //     price: 100.0,
  //   ),
  //   Product(
  //     name: 'Bye #4',
  //     description:
  //         'Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description ',
  //     category: 'Food',
  //     imageUrl:
  //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8HF9WbEG8AH5wFdNDjNKemyMWfZT-sEC6Ht-sMqvystVw8_6uxqEwtFJIWbXm11J5VkQ&usqp=CAU',
  //     price: 165.5,
  //   ),
  //   Product(
  //     name: 'Soft Drink #3',
  //     description:
  //         'Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description ',
  //     category: 'Desserts',
  //     imageUrl:
  //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8HF9WbEG8AH5wFdNDjNKemyMWfZT-sEC6Ht-sMqvystVw8_6uxqEwtFJIWbXm11J5VkQ&usqp=CAU',
  //     price: 200.0,
  //   ),
  //   Product(
  //     name: 'Soft Drink #3',
  //     description:
  //         'Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description ',
  //     category: 'Desserts',
  //     imageUrl:
  //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8HF9WbEG8AH5wFdNDjNKemyMWfZT-sEC6Ht-sMqvystVw8_6uxqEwtFJIWbXm11J5VkQ&usqp=CAU',
  //     price: 200.0,
  //   ),
  //   Product(
  //     name: 'Soft Drink #3',
  //     description:
  //         'Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description ',
  //     category: 'Promotions',
  //     imageUrl:
  //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8HF9WbEG8AH5wFdNDjNKemyMWfZT-sEC6Ht-sMqvystVw8_6uxqEwtFJIWbXm11J5VkQ&usqp=CAU',
  //     price: 200.0,
  //   ),
  //   Product(
  //     name: 'Soft Drink #3',
  //     description:
  //         'Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description ',
  //     category: 'Promotions',
  //     imageUrl:
  //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8HF9WbEG8AH5wFdNDjNKemyMWfZT-sEC6Ht-sMqvystVw8_6uxqEwtFJIWbXm11J5VkQ&usqp=CAU',
  //     price: 200.0,
  //   ),
  //   Product(
  //     name: 'Soft Drink #3',
  //     description:
  //         'Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description ',
  //     category: 'Promotions',
  //     imageUrl:
  //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8HF9WbEG8AH5wFdNDjNKemyMWfZT-sEC6Ht-sMqvystVw8_6uxqEwtFJIWbXm11J5VkQ&usqp=CAU',
  //     price: 200.0,
  //   ),
  //   Product(
  //     name: 'Soft Drink #3',
  //     description:
  //         'Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description ',
  //     category: 'Beverages',
  //     imageUrl:
  //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8HF9WbEG8AH5wFdNDjNKemyMWfZT-sEC6Ht-sMqvystVw8_6uxqEwtFJIWbXm11J5VkQ&usqp=CAU',
  //     price: 200.0,
  //   ),
  // ];

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        category,
        imageUrl,
        price,
      ];
}
