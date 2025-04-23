import 'package:flutter_dotenv/flutter_dotenv.dart';

class EndPoints {
  static final  String signUp = "${dotenv.env["signup"]}";
  static final String signIn = "${dotenv.env["signIn"]}";
  static final String categories = "${dotenv.env["categories"]}";
  static final String allProducts = "${dotenv.env["allProducts"]}";
  static final String allBrands = "${dotenv.env["allBrands"]}";
static final String wishlist ="${dotenv.env["wishlist"]}";
static final String addCart ="${dotenv.env["addCart"]}";
  static String subcategoriesEndpoint(String id) =>
      "${dotenv.env["subcategories"]}$id${dotenv.env["categoryEndpoint"]}";




}