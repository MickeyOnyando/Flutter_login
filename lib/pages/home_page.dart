import 'package:flutter/material.dart';
import 'package:flutter_login/services/auth.dart';

class HomePage extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.grey.shade700,
        actions: <Widget>[
          TextButton.icon(
            onPressed: () async{
              await _auth.signingOut();
            },
            label: const Text('Logout'),
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
    );
  }
}
