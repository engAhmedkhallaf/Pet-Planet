class ItemModel {
  final String? imagePath;
  final String? label;
  final String? items;

  ItemModel({
    required this.imagePath,
    required this.label,
    required this.items,
  });

  static List<ItemModel> list = [
    ItemModel(
      imagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkxV8Gnshho375rRtMf5ekBZ7QsSe1R3BZ28b-G0gl&s',
      label: 'Food',
      items: '120',
    ),
    ItemModel(
      imagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8HF9WbEG8AH5wFdNDjNKemyMWfZT-sEC6Ht-sMqvystVw8_6uxqEwtFJIWbXm11J5VkQ&usqp=CAU',
      label: 'Beverages',
      items: '120',
    ),
    ItemModel(
      imagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcST1amlIW0QA9IO5UHgJI6cU708Wxl9isuPQ0DWh1dO0XvPChGMPxp0wWip4p-yNTCxolE&usqp=CAU',
      label: 'Desserts',
      items: '120',
    ),
    ItemModel(
      imagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkxV8Gnshho375rRtMf5ekBZ7QsSe1R3BZ28b-G0gl&s',
      label: 'Promotions',
      items: '120',
    ),
    ItemModel(
      imagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8HF9WbEG8AH5wFdNDjNKemyMWfZT-sEC6Ht-sMqvystVw8_6uxqEwtFJIWbXm11J5VkQ&usqp=CAU',
      label: 'Beverages',
      items: '120',
    ),
    ItemModel(
      imagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkxV8Gnshho375rRtMf5ekBZ7QsSe1R3BZ28b-G0gl&s',
      label: 'Promotions',
      items: '120',
    ),
    ItemModel(
      imagePath:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8HF9WbEG8AH5wFdNDjNKemyMWfZT-sEC6Ht-sMqvystVw8_6uxqEwtFJIWbXm11J5VkQ&usqp=CAU',
      label: 'Beverages',
      items: '120',
    ),
  ];
}
