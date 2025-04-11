import 'package:flutter_dotenv/flutter_dotenv.dart';

class EndPoints {
  static String signUp = "${dotenv.env["signup"]}";
  static String signIn = "${dotenv.env["signIn"]}";
  static String categories = "${dotenv.env["categories"]}";

  static String subcategoriesEndpoint(String id) =>
      "${dotenv.env["subcategories"]}$id${dotenv.env["categoryEndpoint"]}";




}