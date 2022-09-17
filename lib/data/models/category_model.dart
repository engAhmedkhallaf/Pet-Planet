import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:pet_planet/presentation/resources/assets/assets_manager.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.imageUrl,
    required this.name,
  });

  static Category fromSnapshot(DocumentSnapshot snapshot) {
    Category category = Category(
      name: snapshot['name'] ?? 'No name',
      imageUrl: snapshot['imageUrl'] ?? AssetsManager.noImageUrl,
    );
    return category;
  }
// static List<Category> categoriesList = [
//     Category(
//       imageUrl:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkxV8Gnshho375rRtMf5ekBZ7QsSe1R3BZ28b-G0gl&s',
//       name: 'Food',
//     ),
//     Category(
//       imageUrl:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8HF9WbEG8AH5wFdNDjNKemyMWfZT-sEC6Ht-sMqvystVw8_6uxqEwtFJIWbXm11J5VkQ&usqp=CAU',
//       name: 'Beverages',
//     ),
//     Category(
//       imageUrl:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcST1amlIW0QA9IO5UHgJI6cU708Wxl9isuPQ0DWh1dO0XvPChGMPxp0wWip4p-yNTCxolE&usqp=CAU',
//       name: 'Desserts',
//     ),
//     Category(
//       imageUrl:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkxV8Gnshho375rRtMf5ekBZ7QsSe1R3BZ28b-G0gl&s',
//       name: 'Promotions',
//     ),
//     Category(
//       imageUrl:
//           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8HF9WbEG8AH5wFdNDjNKemyMWfZT-sEC6Ht-sMqvystVw8_6uxqEwtFJIWbXm11J5VkQ&usqp=CAU',
//       name: 'Beverages',
//     ),
//   ];
  
  
  @override
  List<Object?> get props => [
        name,
        imageUrl,
      ];
}
