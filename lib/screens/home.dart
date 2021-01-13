import 'package:flutter/material.dart';
import 'package:hello_world/auth/auth_helper.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Home Screen'),
              SizedBox(
                height: 25.0,
              ),
              RaisedButton(
                child: Text('Log Out'),
                onPressed: () {
                  AuthHelper().Signout();
                },
              )
            ],
          )),
    );
  }
}
