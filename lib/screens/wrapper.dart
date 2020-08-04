import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/authentication/authentication.dart';
import 'package:todo_app/screens/home/home.dart';
import 'package:todo_app/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
