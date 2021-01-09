import 'package:FlutterContacts/componnents/user_tile.dart';
import 'package:FlutterContacts/models/user.dart';
import 'package:FlutterContacts/provider/users.dart';
import 'package:FlutterContacts/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UsersProvider users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.lightBlueAccent,
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
    );
  }
}
