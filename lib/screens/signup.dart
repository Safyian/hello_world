import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_world/auth/auth_helper.dart';

class SignUp extends StatelessWidget {
  TextEditingController userEmail = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Colors.black,
          ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: userEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: 'Enter Email'),
            ),
            TextFormField(
              controller: password,
              decoration: InputDecoration(hintText: 'Enter Password'),
              obscureText: true,
            ),
            RaisedButton(
              onPressed: () {
                if (userEmail.text.isEmpty && password.text.isEmpty) {
                  Get.snackbar('Empty!', 'Please Enter required Fields',
                      snackPosition: SnackPosition.BOTTOM);
                } else if (userEmail.text.isEmpty && password.text.isNotEmpty) {
                  Get.snackbar('Empty!', 'Please Enter your Email',
                      snackPosition: SnackPosition.BOTTOM);
                } else if (userEmail.text.isNotEmpty && password.text.isEmpty) {
                  Get.snackbar('Empty!', 'Please Enter Password',
                      snackPosition: SnackPosition.BOTTOM);
                } else if (userEmail.text.isNotEmpty &&
                    password.text.isNotEmpty) {
                  AuthHelper().signUp(userEmail.text, password.text);
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
