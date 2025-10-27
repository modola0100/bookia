import 'dart:convert';

import 'package:bookia/features/auth/data/models/auth_response/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences pref;
  static String userData = "userData";
  static String Wishlist = "Wishlist";
  static String Cart = "Cart";
  static init() async {
    pref = await SharedPreferences.getInstance();
  }

  static saveUserData(Data? data) {
    if (data == null) return;
    var jsonData = data.toJson();
    var jsonToString = jsonEncode(jsonData);
    saveData(userData, jsonToString);
  }

  static Data? getUserData() {
    String? stringData = getData(userData);
    if (stringData == null) return null;
    var stringToJson = jsonDecode(stringData);

    return Data.fromJson(stringToJson);
  }

  static saveWishlist(List<int> wishListIds) {
    List<String> intToString = wishListIds.map((id) => id.toString()).toList();
    saveData(Wishlist, intToString);
  }

  static List<int>? getWishlist() {
    List<String>? listofStrings = getData(Wishlist);

    if (listofStrings == null) return null;
    List<int>? listOfints = [];
    for (var id in listofStrings) {
      listOfints.add(int.tryParse(id) ?? 0);
    }
    return listOfints;
  }

  static saveCart(List<int> CartIds) {
    List<String> intToString = CartIds.map((id) => id.toString()).toList();
    saveData(Cart, intToString);
  }

  static List<int>? getCart() {
    List<String>? listofStrings = getData(Cart);

    if (listofStrings == null) return null;
    List<int>? listOfints = [];
    for (var id in listofStrings) {
      listOfints.add(int.tryParse(id) ?? 0);
    }
    return listOfints;
  }

  static saveData(String key, dynamic value) {
    if (value is int) {
      pref.setInt(key, value);
    } else if (value is String) {
      pref.setString(key, value);
    } else if (value is double) {
      pref.setDouble(key, value);
    } else if (value is bool) {
      pref.setBool(key, value);
    } else if (value is List<String>) {
      pref.setStringList(key, value);
    }
  }

  static dynamic getData(String key) {
    return pref.get(key);
  }

  static remove(String key) async {
    await pref.remove(key);
  }
}
