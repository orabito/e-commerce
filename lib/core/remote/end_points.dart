import 'package:flutter_dotenv/flutter_dotenv.dart';

class EndPoints {
  static  String signUp="${dotenv.env["signup"]}";
  static  String signIn="${dotenv.env["signIn"]}";


}