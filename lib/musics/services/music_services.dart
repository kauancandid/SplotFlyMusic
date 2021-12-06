import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:player_m/musics/models/Product.dart';


class MusicServices {
  static Future<List<Product>> getProducts() async {
    String productData = await rootBundle.loadString('assets/json/musics.json');
    List<dynamic> productsData = jsonDecode(productData);
    return productsData.map((json) => Product.fromJson(json)).toList();

  }
}