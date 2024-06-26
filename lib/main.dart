import 'package:flutter/material.dart';
import 'package:learn_flutter_mvvm/utils/routes/routes.dart';
import 'package:learn_flutter_mvvm/utils/routes/routes_name.dart';
import 'package:learn_flutter_mvvm/view_modal/auth_view_modal.dart';
import 'package:learn_flutter_mvvm/view_modal/user_view_modal.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthViewModal()),
        ChangeNotifierProvider(create: (context) => UserViewModal())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const LoginScreen(),
        initialRoute: RoutesName.splashView,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}


