
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter_mvvm/repository/auth_repository.dart';
import 'package:learn_flutter_mvvm/utils/routes/routes_name.dart';
import 'package:learn_flutter_mvvm/utils/utils.dart';

class AuthViewModal with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool loading = false;
  bool signUploading = false;

  setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    signUploading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value){
      setLoading(false);
      Utils.snackBar('Login Successfully', context);
      Navigator.pushNamed(context, RoutesName.home);
      if(kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if(kDebugMode) {
        Utils.snackBar(error.toString(), context);
        print(error.toString());
      }

    });
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async{
    setSignUpLoading(true);
    _myRepo.signUpApi(data).then((value){
      setSignUpLoading(false);
      Utils.snackBar('SignUp Successfully', context);
      Navigator.pushNamed(context, RoutesName.home);
      if(kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      if(kDebugMode) {
        Utils.snackBar(error.toString(), context);
        print(error.toString());
      }

    });
  }
}