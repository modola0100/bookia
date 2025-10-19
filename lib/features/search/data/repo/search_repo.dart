import 'dart:developer';

import 'package:bookia/features/search/data/models/searchresponse/searchresponse.dart';
import 'package:bookia/services/dio/dio_endpoints.dart';
import 'package:bookia/services/dio/dio_provider.dart';

class SearchRepo {
  static Future<Searchresponse?> getAllProducts() async {
    try {
      var res = await DioProvider.get(path: DioEndpoints.allProducts);

      if (res.statusCode == 200) {
        return Searchresponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<Searchresponse?> searchProducts({required String name}) async {
    try {
      var res = await DioProvider.get(
        path: DioEndpoints.searchProducts,
        queryParameters: {"name": name},
      );

      if (res.statusCode == 200) {
        return Searchresponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
