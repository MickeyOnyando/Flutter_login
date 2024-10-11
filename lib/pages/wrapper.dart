import 'package:flutter/material.dart';
import 'package:flutter_login/models/user.dart';
import 'package:flutter_login/pages/authenticate.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper ({super.key});

  @override
  Widget build(BuildContext context) {

    final  appUserOne = Provider.of<AppUser?>(context);
    print(appUserOne);

    
    return const Authenticate();
  }
}