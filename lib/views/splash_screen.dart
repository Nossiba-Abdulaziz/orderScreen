import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5),(){
      Navigator.pushNamedAndRemoveUntil(context, "/home", (route)=>false);
    });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.center,
children: [
  Center(child: Image.asset(height: 400 ,width: 300,"assets/images/picture.png")),
SizedBox(height: 40,),
  Center(child: CircularProgressIndicator(color: Colors.blue,) ,),
],


      ),
    );
  }
}
