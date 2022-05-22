
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          TextField(
            controller: emailController,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: "Enter your Email"
            ),
          ),
          SizedBox(height: 4),
          TextField(
            controller: passwordController,
            cursorColor: Colors.white,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
                labelText: "Enter your Password"
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                maximumSize: Size.fromHeight(50),
              ),
              icon: Icon(Icons.lock_open, size: 32),
              label: Text("Log in", style: TextStyle(fontSize: 24),),
              onPressed: (){
                print("Trying to Login");
                login(emailController.text.trim(), passwordController.text.trim());
              } ),
        ],
      ),
    );


  }
}
Future login(email, password) async {
  print("Signing In");
  await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
}
