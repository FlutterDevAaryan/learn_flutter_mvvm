import 'package:flutter/material.dart';
import 'package:learn_flutter_mvvm/utils/routes/routes_name.dart';
import 'package:learn_flutter_mvvm/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
        ElevatedButton(
            onPressed: () {

              // Utils.flushBarErrorMessage('No internet connection', context);
              Utils.snackBar('No internet connection', context);
              // Utils.toastMessage('No internet connection');

              // Navigator.pushNamed(context, RoutesName.home);
              Navigator.pushNamed(context, RoutesName.loginView);
              // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
            }, child: Text('Click'))

      )
    );
  }
}
