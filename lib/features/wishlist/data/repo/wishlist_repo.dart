import 'dart:developer';

import 'package:bookia/features/wishlist/data/models/wishlistresponse/datum.dart';
import 'package:bookia/features/wishlist/data/models/wishlistresponse/wishlistresponse.dart';
import 'package:bookia/services/dio/dio_endpoints.dart';
import 'package:bookia/services/dio/dio_provider.dart';
import 'package:bookia/services/local/shared_pref.dart';

class WishlistRepo {
  static Future<Wishlistresponse?> getWishlist() async {
    try {
      var res = await DioProvider.get(
        path: DioEndpoints.wishlist,
        headers: {"Authorization": "Bearer ${SharedPref.getUserData()?.token}"},
      );

      if (res.statusCode == 200) {
        var data = Wishlistresponse.fromJson(res.data);
        saveWishlistToLocal(data.data?.data ?? []);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<Wishlistresponse?> addToWishlist({
    required int productId,
  }) async {
    try {
      var res = await DioProvider.post(
        endPoint: DioEndpoints.add_to_wishlist,
        headers: {"Authorization": "Bearer ${SharedPref.getUserData()?.token}"},
        data: {"product_id": productId},
      );

      if (res.statusCode == 200) {
        var data = Wishlistresponse.fromJson(res.data);
        saveWishlistToLocal(data.data?.data ?? []);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<Wishlistresponse?> removeFromtWishlist({
    required int productId,
  }) async {
    try {
      var res = await DioProvider.post(
        endPoint: DioEndpoints.remove_from_wishlist,
        headers: {"Authorization": "Bearer ${SharedPref.getUserData()?.token}"},
        data: {"product_id": productId},
      );

      if (res.statusCode == 200) {
        var data = Wishlistresponse.fromJson(res.data);
        saveWishlistToLocal(data.data?.data ?? []);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static saveWishlistToLocal(List<Datum> wihlistIds) {
    if (wihlistIds.isEmpty) {
      SharedPref.saveWishlist([]);
    } else {
      List<int> bookIds = [];
      for (var id in wihlistIds) {
        bookIds.add(id.id ?? 0);
      }
      SharedPref.saveWishlist(bookIds);
    }
  }
}
