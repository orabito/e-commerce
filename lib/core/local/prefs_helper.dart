
import 'dart:convert';
import 'package:ecommerce_app/features/auth/sign_up/domain/entity/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PrefsHelper {
 static late SharedPreferences prefs;
  static Future<void> initPrefs() async {
    prefs= await SharedPreferences.getInstance();
  }
static Future<bool> saveToken(String token)async{
return  prefs.setString("token", token);
}
 static String?  getToken()  {
    return  prefs.getString("token");

}
static Future<bool> deleteToken() {
   return prefs.remove("token");
}
static Future<bool> deleteUser() {
   return prefs.remove("user");
}


 static Future<bool>? saveUser(UserEntity? user) {
   if (user == null) return null;
    return prefs.setString("user", jsonEncode(user.toJson()));
  }
static UserEntity? getUser()  {
  final json = prefs.getString("user");
  if (json == null) {
    return null;
  }
  final decodedJson = jsonDecode(json) ;
  return UserEntity.fromJson(decodedJson);

}

//  static Future<bool> saveName(String name){
//    return prefs.setString("name",name );
//  }
//  static String? getName(){
//    return prefs.getString("name");
//  }



}