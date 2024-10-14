import 'package:flutter/material.dart';
import 'package:flutter_login/pages/register.dart';
import 'package:flutter_login/pages/sign_in.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn =!showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn(toggleView:  toggleView);

    }else{
      return RegisterPage(toggleView:  toggleView);
    }
  }
}
