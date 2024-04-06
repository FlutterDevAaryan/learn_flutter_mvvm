
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:learn_flutter_mvvm/modals/user_model.dart';
import 'package:learn_flutter_mvvm/utils/routes/routes_name.dart';
import 'package:learn_flutter_mvvm/view_modal/user_view_modal.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModal().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) async {
      debugPrint('token = ${value.token}');
      if(value.token == 'null' ||  value.token == "") {
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context,RoutesName.loginView);
      } else {
        await Future.delayed(Duration(seconds: 3));

        Navigator.pushNamed(context,RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if(kDebugMode) {
        print(error.toString());
      }
    });
  }

}