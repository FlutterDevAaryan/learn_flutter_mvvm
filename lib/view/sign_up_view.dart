import 'package:flutter/material.dart';
import 'package:learn_flutter_mvvm/resources/components/round_button.dart';
import 'package:learn_flutter_mvvm/utils/routes/routes_name.dart';
import 'package:learn_flutter_mvvm/utils/utils.dart';
import 'package:learn_flutter_mvvm/view_modal/auth_view_modal.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
        title: Text('SignUp'),
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
              decoration: InputDecoration(
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
              title: 'SignUp',
              loading: authViewMode.signUploading,
              onPress: () {
                if(_emailController.text.isEmpty) {
                  Utils.snackBar('Please enter email', context);
                } else if(_passwordController.text.isEmpty) {
                  Utils.snackBar('Please enter password', context);
                } else if(_passwordController.text.length < 6) {
                  Utils.snackBar('Please enter 6 digit password', context);
                } else {
                  Map data ={
                    'email' : _emailController.text.toString(),
                    'password' : _passwordController.text.toString()
                  };
                  authViewMode.signUpApi(data, context);
                  print('api hit');
                }
              },
            ),

            SizedBox(
              height: Utils.height(context) * .1,
            ),

            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.loginScreen);
              },
              child: Text('Already have an account? Login'),
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
