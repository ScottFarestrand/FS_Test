import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final myuser = FirebaseAuth.instance.currentUser;
    if ( myuser == null ){
      print("Null");
    }else{
      print("Not Null");
    }
    return Scaffold(

      body: Column(children: [
        Text("Logged In"),
        ElevatedButton(onPressed: (){
          print("Signing out Out");
          logout();
        }, child: Text('Log out'),),
      ],),
    );
  }
}
Future logout() async {
  print("Signing Out");
  await FirebaseAuth.instance.signOut();
}
