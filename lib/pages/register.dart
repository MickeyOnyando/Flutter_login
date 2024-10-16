import 'package:flutter/material.dart';
import 'package:flutter_login/services/auth.dart';

class RegisterPage extends StatefulWidget {
  final Function toggleView;

  const RegisterPage({super.key,  required this.toggleView});


  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //input state
  String email = '';
  String password = '';
  String error= '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.grey.shade600,
        title: const Text('Register'),
        actions: [
          TextButton.icon(
            icon: const Icon(Icons.person),
            onPressed: () {
              widget.toggleView();
            },
            label: const Text('Sign In'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                validator: (val) => val?.isEmpty ?? false  ? 'Enter an Email': null,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                validator: (val) => (val?.length ?? 0) < 6? 'Enter a 6 + character password': null,

                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () async{
                  if(_formKey.currentState?.validate() ?? false){
                   dynamic result =  await _auth.registerWithEmailAndPassword(email, password);
                   if(result == null){
                    setState(() {
                      error = 'Please supply a valid email';
                    });
                   }
                  }
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
              const SizedBox(height: 20,),
              Text(
                error,
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

