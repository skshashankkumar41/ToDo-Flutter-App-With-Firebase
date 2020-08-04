import 'package:flutter/material.dart';
import 'package:todo_app/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[200],
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[500],
        title: Text("ToDo List"),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                await _auth.SignOut();
              },
              icon: Icon(Icons.person),
              label: Text("Logout"))
        ],
      ),
    );
  }
}
