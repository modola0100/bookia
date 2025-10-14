import 'package:bookia/features/home/data/models/best_seller_response/product.dart';

class Datum {
  int? id;
  String? name;
  String? price;
  String? category;
  String? image;
  int? discount;
  int? stock;
  String? description;
  int? bestSeller;

  Datum({
    this.id,
    this.name,
    this.price,
    this.category,
    this.image,
    this.discount,
    this.stock,
    this.description,
    this.bestSeller,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: json['price'] as String?,
      category: json['category'] as String?,
      image: json['image'] as String?,
      discount: json['discount'] as int?,
      stock: json['stock'] as int?,
      description: json['description'] as String?,
      bestSeller: json['best_seller'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'category': category,
      'image': image,
      'discount': discount,
      'stock': stock,
      'description': description,
      'best_seller': bestSeller,
    };
  }

  Product mapToProduct() {
    return Product(
      id: id,
      name: name,
      description: description,
      category: category,
      image: image,
      price: price,
      priceAfterDiscount: double.tryParse(price ?? "0"),
      bestSeller: bestSeller,
      discount: discount,
      stock: stock,
    );
  }
}
