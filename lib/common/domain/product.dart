import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_task/common/domain/category.dart';
import 'package:grocery_task/common/domain/product_badge.dart';

class Product {
  const Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageAsset,
    required this.colorValue,
    this.category,
    this.badge,
  });

  final String name;
  final String description;
  final double price;
  final Category? category;

  final String imageAsset;

  final int colorValue;

  final ProductBadge? badge;

  factory Product.fromFirestore(DocumentSnapshot doc) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Product(
      name: doc.id,
      description: data["description"],
      price: data["price"].toDouble(),
      imageAsset: data["imageAsset"],
      colorValue: data["colorValue"],
    );
  }
}
