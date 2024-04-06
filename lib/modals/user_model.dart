import 'dart:convert';
/// token : "QpwL5tke4Pnpja7X4"

UserModel loginModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String loginModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? _token;

  UserModel({
      String? token, String? userName}){
    _token = token;
}

  UserModel.fromJson(dynamic json) {
    _token = json['token'];
  }

UserModel copyWith({  String? token, String? userName
}) => UserModel( token: token ?? _token,
);
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    return map;
  }

}