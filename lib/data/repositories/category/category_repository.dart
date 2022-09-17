import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_planet/data/collections_manager.dart';
import 'package:pet_planet/data/models/category_model.dart';
import 'package:pet_planet/data/repositories/category/base_category_repository.dart';

class CategoryRepository extends BaseCategoryRepository {
  final FirebaseFirestore _firebaseFirestore;

  CategoryRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Category>> getAllCategories() {
    return _firebaseFirestore
        .collection(CollectionManager.categoriesCollection)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Category.fromSnapshot(doc)).toList();
    });
  }
}
