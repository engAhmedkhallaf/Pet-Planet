import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String description;
  final String category;
  final String imageUrl;
  final double price;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.price,
  });

  static List<Product> productList = const [
    Product(
      id: '1',
      name: 'Soft Drink #1',
      description:
          'Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description ',
      category: 'Food',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8HF9WbEG8AH5wFdNDjNKemyMWfZT-sEC6Ht-sMqvystVw8_6uxqEwtFJIWbXm11J5VkQ&usqp=CAU',
      price: 200.0,
    ),
    Product(
      id: '2',
      name: 'Drink #2',
      description:
          'Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description ',
      category: 'Food',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8HF9WbEG8AH5wFdNDjNKemyMWfZT-sEC6Ht-sMqvystVw8_6uxqEwtFJIWbXm11J5VkQ&usqp=CAU',
      price: 50.0,
    ),
    Product(
      id: '3',
      name: 'Hi #3',
      description:
          'Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description ',
      category: 'Food',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8HF9WbEG8AH5wFdNDjNKemyMWfZT-sEC6Ht-sMqvystVw8_6uxqEwtFJIWbXm11J5VkQ&usqp=CAU',
      price: 100.0,
    ),
    Product(
      id: '4',
      name: 'Bye #4',
      description:
          'Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description ',
      category: 'Food',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8HF9WbEG8AH5wFdNDjNKemyMWfZT-sEC6Ht-sMqvystVw8_6uxqEwtFJIWbXm11J5VkQ&usqp=CAU',
      price: 165.5,
    ),
    Product(
      id: '5',
      name: 'Soft Drink #3',
      description:
          'Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description ',
      category: 'Desserts',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8HF9WbEG8AH5wFdNDjNKemyMWfZT-sEC6Ht-sMqvystVw8_6uxqEwtFJIWbXm11J5VkQ&usqp=CAU',
      price: 200.0,
    ),
    Product(
      id: '6',
      name: 'Soft Drink #3',
      description:
          'Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description ',
      category: 'Desserts',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8HF9WbEG8AH5wFdNDjNKemyMWfZT-sEC6Ht-sMqvystVw8_6uxqEwtFJIWbXm11J5VkQ&usqp=CAU',
      price: 200.0,
    ),
    Product(
      id: '7',
      name: 'Soft Drink #3',
      description:
          'Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description ',
      category: 'Promotions',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8HF9WbEG8AH5wFdNDjNKemyMWfZT-sEC6Ht-sMqvystVw8_6uxqEwtFJIWbXm11J5VkQ&usqp=CAU',
      price: 200.0,
    ),
    Product(
      id: '8',
      name: 'Soft Drink #3',
      description:
          'Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description ',
      category: 'Promotions',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8HF9WbEG8AH5wFdNDjNKemyMWfZT-sEC6Ht-sMqvystVw8_6uxqEwtFJIWbXm11J5VkQ&usqp=CAU',
      price: 200.0,
    ),
    Product(
      id: '9',
      name: 'Soft Drink #3',
      description:
          'Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description ',
      category: 'Promotions',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8HF9WbEG8AH5wFdNDjNKemyMWfZT-sEC6Ht-sMqvystVw8_6uxqEwtFJIWbXm11J5VkQ&usqp=CAU',
      price: 200.0,
    ),
    Product(
      id: '10',
      name: 'Soft Drink #3',
      description:
          'Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description Lorem description ',
      category: 'Beverages',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8HF9WbEG8AH5wFdNDjNKemyMWfZT-sEC6Ht-sMqvystVw8_6uxqEwtFJIWbXm11J5VkQ&usqp=CAU',
      price: 200.0,
    ),
  ];

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
