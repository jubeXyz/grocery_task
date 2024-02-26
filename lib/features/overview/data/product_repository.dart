import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_task/common/domain/product.dart';

class ProductRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<List<Product>> get products {
    final productsCollectionRef = _firestore.collection("products");
    return productsCollectionRef.snapshots().map((snapshot) => snapshot.docs
        .map((product) => Product.fromFirestore(product))
        .toList());
  }
}
