import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_login/models/user.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  //create a user object from AppUser
  AppUser? _userFromFirebaseUser (User user){
   return user != null ? AppUser(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<AppUser?> get user {
      return _auth.authStateChanges()
      .map((User? user) => _userFromFirebaseUser(user!));
    }

  //Sign in with anonymous
  Future signInAnon() async {
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);

    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign in with email & password

  //register with email and password

  //sign out
  Future signingOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}