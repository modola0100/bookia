import 'links.dart';
import 'meta.dart';
import 'product.dart';

class Data {
  List<SearchProductModel>? products;
  Meta? meta;
  Links? links;

  Data({this.products, this.meta, this.links});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => SearchProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'products': products?.map((e) => e.toJson()).toList(),
      'meta': meta?.toJson(),
      'links': links?.toJson(),
    };
  }
}
