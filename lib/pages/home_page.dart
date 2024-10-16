import 'package:flutter/material.dart';
import 'package:flutter_login/services/auth.dart';

class HomePage extends StatelessWidget {

  final AuthService _auth = AuthService();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.grey.shade700,
        actions: [
          TextButton.icon(
            onPressed: () async {
              try {
                await _auth.signingOut();
                // Navigate to the login page or any other page after sign out
                
              } catch (e) {
                print('Error signing out: $e');
              }
            },
            label: const Text('Logoff'),
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
    );
  }
}
