import 'package:flutter/material.dart';
import 'package:todo_app/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  String email = '';
  String pass = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightGreen[200],
        appBar: AppBar(
          backgroundColor: Colors.lightGreen[500],
          title: Text("Sign In to ToDo App"),
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () {
                  widget.toggleView();
                },
                icon: Icon(Icons.person),
                label: Text("Register"))
          ],
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Enter an Email';
                      } else {
                        return null;
                      }
                    },
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    obscureText: true,
                    validator: (val) => val.length < 6
                        ? 'Enter a password 6+ chars long'
                        : null,
                    onChanged: (val) {
                      setState(() {
                        pass = val;
                      });
                    },
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    color: Colors.green[200],
                    child:
                        Text('Sign In', style: TextStyle(color: Colors.white)),
                    onPressed: () async {
                      if (_formkey.currentState.validate()) {
                        dynamic result = await _auth.SignInemail(email, pass);

                        if (result == null) {
                          setState(() {
                            error = 'Incorrect Credentials, Could not Sign In';
                          });
                        }
                      }
                    },
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  )
                ],
              ),
            )));
  }
}
