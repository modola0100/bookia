import 'dart:developer';

import 'package:bookia/features/home/data/models/best_seller_response/best_seller_response.dart';
import 'package:bookia/features/home/data/models/sliders_response/sliders_response.dart';
import 'package:bookia/services/dio/dio_endpoints.dart';
import 'package:bookia/services/dio/dio_provider.dart';

class HomeRepo {
  static Future<BestSellerResponse?> getBestSeller() async {
    try {
      var res = await DioProvider.get(path: DioEndpoints.products_bestseller);

      if (res.statusCode == 200) {
        return BestSellerResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<SlidersResponse?> getSliders() async {
    try {
      var res = await DioProvider.get(path: DioEndpoints.sliders);

      if (res.statusCode == 200) {
        return SlidersResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
