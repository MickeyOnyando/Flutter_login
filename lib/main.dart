import 'package:flutter/material.dart';
import 'package:flutter_login/models/user.dart';
import 'package:flutter_login/pages/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_login/services/auth.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: const Wrapper(),
      ),
    );
  }
}
