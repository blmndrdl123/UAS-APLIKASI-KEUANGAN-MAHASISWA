import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uts_pemmobile/mainmenu.dart';
import '/screen/auth_screen.dart';
import '/services/notes_service.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Handle Auth
  handleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return MainMenu();
        } else {
          return AuthScreen();
        }
      },
    );
  }

  // Sign Out
  signOut() {
    _auth.signOut();
  }

  // Sign In
  signIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  // Sign Up
  signUp(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}
