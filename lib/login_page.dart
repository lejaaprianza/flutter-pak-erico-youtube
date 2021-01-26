import 'package:flutter/material.dart';
import 'package:hello_world/auth_services.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 100,
              width: 300,
              child: TextField(
                controller: emailController,
              ),
            ),
            Container(
              height: 100,
              width: 300,
              child: TextField(
                controller: passwordController,
              ),
            ),
            RaisedButton(
              onPressed: () async {
                await AuthServices.signInAnonymous();
              },
              child: Text("Sign In Anonymous"),
            ),
            RaisedButton(
              onPressed: () async {
                await AuthServices.signIn(
                    emailController.text, passwordController.text);
              },
              child: Text("Sign In"),
            ),
            RaisedButton(
              onPressed: () async {
                await AuthServices.signUp(
                    emailController.text, passwordController.text);
              },
              child: Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
