import 'package:flutter/material.dart';
import 'package:tiktoks/constants.dart';
import 'package:tiktoks/views/widgets/text_input_field.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Tiktok',
            style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.bold, color: buttonColor),
          ),
          SizedBox(height: 10),
          Text(
            'Login',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: buttonColor),
          ),
          SizedBox(height: 25),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextInputField(
              controller: _emailController,
              labelText: "Email",
              icon: Icons.mail,
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextInputField(
              controller: _passwordController,
              labelText: "Password",
              icon: Icons.lock,
              isObscure: true,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 40,
            height: 50,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: InkWell(
              onTap: () => authController.loginUser(
                  _emailController.text, _passwordController.text),
              child: Center(
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text(
              'Don\'t have an account ? ',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              width: 5,
            ),
            InkWell(
              onTap: () => print('navigating users'),
              child: Text(
                'Register',
                style: TextStyle(fontSize: 20, color: buttonColor),
              ),
            )
          ]),
        ],
      ),
    ));
  }
}
