import 'package:equatable/equatable.dart';
import 'package:pet_planet/data/models/product_model.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;
  final List<Product> products;

  const Category({
    required this.imageUrl,
    required this.name,
    required this.products,
  });

  static List<Category> categoriesList = [
    Category(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkxV8Gnshho375rRtMf5ekBZ7QsSe1R3BZ28b-G0gl&s',
      name: 'Food',
      products: Product.productList,
    ),
    Category(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8HF9WbEG8AH5wFdNDjNKemyMWfZT-sEC6Ht-sMqvystVw8_6uxqEwtFJIWbXm11J5VkQ&usqp=CAU',
      name: 'Beverages',
      products: Product.productList,
    ),
    Category(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcST1amlIW0QA9IO5UHgJI6cU708Wxl9isuPQ0DWh1dO0XvPChGMPxp0wWip4p-yNTCxolE&usqp=CAU',
      name: 'Desserts',
      products: Product.productList,
    ),
    Category(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkxV8Gnshho375rRtMf5ekBZ7QsSe1R3BZ28b-G0gl&s',
      name: 'Promotions',
      products: Product.productList,
    ),
    Category(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8HF9WbEG8AH5wFdNDjNKemyMWfZT-sEC6Ht-sMqvystVw8_6uxqEwtFJIWbXm11J5VkQ&usqp=CAU',
      name: 'Beverages',
      products: Product.productList,
    ),
  ];

  @override
  List<Object?> get props => [
        name,
        imageUrl,
      ];
}
