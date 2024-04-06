
import 'package:flutter/material.dart';
import 'package:learn_flutter_mvvm/utils/routes/routes_name.dart';
import 'package:learn_flutter_mvvm/utils/utils.dart';
import 'package:learn_flutter_mvvm/view_modal/auth_view_modal.dart';
import 'package:provider/provider.dart';

import '../resources/components/round_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  ValueNotifier _obsurePassword = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModal>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
                // FocusScope.of(context).requestFocus(passwordFocusNode);
              },
              decoration: const InputDecoration(
                hintText: "Email",
                labelText: "Email",
                prefixIcon: Icon(Icons.alternate_email)
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _obsurePassword,
              builder: (BuildContext context, value, Widget? child) {
                return TextFormField(
                  controller: _passwordController,
                  obscureText: _obsurePassword.value,
                  focusNode: passwordFocusNode,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      prefixIcon: Icon(Icons.alternate_email),
                      suffixIcon: InkWell(
                          onTap: () {
                            _obsurePassword.value = !_obsurePassword.value;
                          },
                          child: Icon(_obsurePassword.value ? Icons.visibility_off_outlined :Icons.visibility))
                  ),
                );
              },
            ),

            SizedBox(
              height: Utils.height(context) * .1,
            ),

            RoundButton(
              title: 'Login',
              loading: authViewMode.loading,
              onPress: () {
                if(_emailController.text.isEmpty) {
                  Utils.snackBar('Please enter email', context);
                } else if(_passwordController.text.isEmpty) {
                  Utils.snackBar('Please enter password', context);
                } else if(_passwordController.text.length < 6) {
                  Utils.snackBar('Please enter 6 digit password', context);
                } else {
                  Map data ={
                    'email' : _emailController.text.toString(), /*Correct Email is eve.holt@reqres.in*/
                    'password' : _passwordController.text.toString()  /*Correct Password is cityslicka*/
                  };
                  authViewMode.loginApi(data, context);
                  print('api hit');
                }
              },),

            SizedBox(
              height: Utils.height(context) * .1,
            ),

            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.signUpView);
              },
              child: Text('Don\'t have an account? Sign Up'),
            )

          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  _emailController.dispose();
  _passwordController.dispose();

  emailFocusNode.dispose();
  passwordFocusNode.dispose();

  _obsurePassword.dispose();
  }
}
