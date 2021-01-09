import 'package:FlutterContacts/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:FlutterContacts/models/user.dart';
import 'package:FlutterContacts/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AppRoutes.USER_FORM, arguments: user);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.deepOrange,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Delete User'),
                    content: Text('Are u sure?'),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text('No'),
                      ),
                      FlatButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: Text('Yes'),
                      ),
                    ],
                  ),
                ).then((confirmed) {
                  if (confirmed) {
                    Provider.of<UsersProvider>(context, listen: false)
                        .delete(user);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
