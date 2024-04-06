import 'package:flutter/material.dart';
import 'package:learn_flutter_mvvm/utils/routes/routes_name.dart';
import 'package:learn_flutter_mvvm/utils/utils.dart';
import 'package:provider/provider.dart';

import '../view_modal/user_view_modal.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModal>(context);
    return Scaffold(
      body: Center(
        child: Container(
          height: Utils.height(context) * 0.1,
          width: Utils.width(context) * 0.5,
          color: Colors.lightGreen,
          child: Center(
              child: InkWell(
                onTap: () {
                  userPreference.remove().then((value) {
                    Navigator.pushNamed(context, RoutesName.loginView);
                  });
                },
                  child: Text('Logout'))),
        ),
      ),
    );
  }
}
