import 'package:ecommerce_app/features/auth/sign_up/data/model/signUp_response/user.dart';
import 'package:ecommerce_app/features/auth/sign_up/domain/entity/signUpEntity/signUpEntity.dart';

class SignUpResponse {
  String? message;
  String? statusMsg;
  User? user;
  String? token;

  SignUpResponse({this.message, this.statusMsg, this.user, this.token});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['statusMsg'] = statusMsg;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }

  SignUpEntity toSignUpEntity() {
    return SignUpEntity(
      token: token,
      user: user?.toUserEntity(),
    );
  }
}
