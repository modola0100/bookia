import 'dart:developer';

import 'package:bookia/features/cart/data/models/cart_response/cart_item.dart';
import 'package:bookia/features/cart/data/models/cart_response/cart_response.dart';
import 'package:bookia/services/dio/dio_endpoints.dart';
import 'package:bookia/services/dio/dio_provider.dart';
import 'package:bookia/services/local/shared_pref.dart';

class CartRepo {
  static Future<CartResponse?> getCart() async {
    try {
      var res = await DioProvider.get(
        path: DioEndpoints.showCart,
        headers: {"Authorization": "Bearer ${SharedPref.getUserData()?.token}"},
      );

      if (res.statusCode == 200) {
        var data = CartResponse.fromJson(res.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<CartResponse?> addToCart({required int productId}) async {
    try {
      var res = await DioProvider.post(
        endPoint: DioEndpoints.addToCart,
        headers: {"Authorization": "Bearer ${SharedPref.getUserData()?.token}"},
        data: {"product_id": productId},
      );

      if (res.statusCode == 201) {
        var data = CartResponse.fromJson(res.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<CartResponse?> removeFromCart({required int cartItemId}) async {
    try {
      var res = await DioProvider.post(
        endPoint: DioEndpoints.removeFromCart,
        headers: {"Authorization": "Bearer ${SharedPref.getUserData()?.token}"},
        data: {"cart_item_id": cartItemId},
      );

      if (res.statusCode == 200) {
        var data = CartResponse.fromJson(res.data);
        saveCartToLocal(data.data?.cartItems ?? []);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<CartResponse?> updateCart({
    required int cartItemId,
    required int quantity,
  }) async {
    try {
      var res = await DioProvider.post(
        endPoint: DioEndpoints.updateCart,
        headers: {"Authorization": "Bearer ${SharedPref.getUserData()?.token}"},
        data: {"cart_item_id": cartItemId, "quantity": quantity},
      );

      if (res.statusCode == 201) {
        var data = CartResponse.fromJson(res.data);
        saveCartToLocal(data.data?.cartItems ?? []);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static saveCartToLocal(List<CartItem> CartIds) {
    if (CartIds.isEmpty) {
      SharedPref.saveCart([]);
    } else {
      List<int> bookIds = [];
      for (var id in CartIds) {
        bookIds.add(id.itemId ?? 0);
      }
      SharedPref.saveCart(bookIds);
    }
  }
}
