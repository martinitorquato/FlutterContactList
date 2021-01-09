import 'package:FlutterContacts/routes/app_routes.dart';
import 'package:FlutterContacts/screens/user_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/user_list.dart';
import 'provider/users.dart';
import 'package:FlutterContacts/models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => UsersProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          AppRoutes.HOME: (_) => UserList(),
          AppRoutes.USER_FORM: (ctx) => UserForm()
        },
      ),
    );
  }
}
