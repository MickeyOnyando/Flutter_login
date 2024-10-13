import 'package:flutter/material.dart';
import 'package:flutter_login/services/auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthService _auth = AuthService();

  //input state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.grey.shade600,
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () async{
                  print(email);
                  print(password);
                },
                style: const ButtonStyle(
                  fixedSize: WidgetStatePropertyAll<Size>(
                    Size(200.0, 50.0),
                  ),
                  backgroundColor: WidgetStatePropertyAll<Color>(
                    Colors.blue,
                  ),
                ),
                child: const Text(
                  "Register",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

