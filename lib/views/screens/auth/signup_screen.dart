import 'package:flutter/material.dart';
import 'package:tiktoks/constants.dart';
import 'package:tiktoks/views/widgets/text_input_field.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  SignUpScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tiktok',
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: buttonColor),
            ),
            SizedBox(height: 10),
            Text(
              'Register',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: buttonColor),
            ),
            Stack(
              children: [
                CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage(
                      'https://img.icons8.com/office/2x/person-male.png'),
                  backgroundColor: Colors.amber,
                ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    icon: Icon(Icons.add_a_photo),
                    onPressed: () => authController.pickImage(),
                  ),
                )
              ],
            ),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                  controller: _userNameController,
                  labelText: "User Name",
                  icon: Icons.person),
            ),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _emailController,
                labelText: "Email",
                icon: Icons.mail,
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                  controller: _passwordController,
                  labelText: "Password",
                  isObscure: true,
                  icon: Icons.lock),
            ),
            SizedBox(
              height: 15,
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
                onTap: () => authController.registerUser(
                    _emailController.text,
                    _passwordController.text,
                    _userNameController.text,
                    authController.Profilephoto),
                child: Center(
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text(
                'Already have an account ? ',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () => print('navigating users to'),
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 20, color: buttonColor),
                ),
              )
            ]),
          ],
        ),
      ),
    ));
  }
}
