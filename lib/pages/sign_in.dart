import 'package:flutter/material.dart';
import 'package:flutter_login/services/auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            dynamic result = await _auth.signInAnon();

            if(result == null){
              print("Error, couldn't sign in");
            }else{
              print("Signed in successfully");
              print(result.uid);
            }
          },
          child: const Text("Sign In Anon"),
        ),
      ),
    );
  }
}
