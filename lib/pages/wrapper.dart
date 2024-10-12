import 'package:flutter/material.dart';
import 'package:flutter_login/models/user.dart';
import 'package:flutter_login/pages/authenticate.dart';
import 'package:flutter_login/pages/home_page.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper ({super.key});

  @override
  Widget build(BuildContext context) {

    final  appUserOne = Provider.of<AppUser?>(context);
    
    if(appUserOne == null){
      return const Authenticate();
    }else{
      return HomePage();

    }
  }
}