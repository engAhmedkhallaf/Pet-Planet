import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_planet/data/collections_manager.dart';
import 'package:pet_planet/data/models/product_model.dart';
import 'package:pet_planet/data/repositories/product/base_product_repository.dart';

class ProductRepository extends BaseProductRepository{

  final FirebaseFirestore _firebaseFirestore;

  ProductRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllProducts() {
     return _firebaseFirestore
        .collection(CollectionManager.productsCollection)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }
}