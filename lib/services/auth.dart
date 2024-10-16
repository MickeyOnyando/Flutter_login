import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login/models/user.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  //create a user object from AppUser
  AppUser? _userFromFirebaseUser (User user){
   return AppUser(uid: user.uid);
  }

  //auth change user stream
  Stream<AppUser ?> get user {
  return FirebaseAuth.instance.authStateChanges().map((User ? user) {
    return user != null ? AppUser (uid: user.uid) : null; // Ensure this handles null
  });
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
  Future signingInWithEmailAndPassword(String email, String pwd) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: pwd);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //register with email and password
  Future registerWithEmailAndPassword(String email, String pwd) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: pwd);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

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