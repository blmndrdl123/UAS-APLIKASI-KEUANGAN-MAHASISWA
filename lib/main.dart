import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uts_pemmobile/launcher.dart';
import 'package:uts_pemmobile/login.dart';
import 'package:uts_pemmobile/login1.dart';
import 'package:uts_pemmobile/screen/auth_screen.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BUKU KEUANGAN MAHASISWA',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey),
      ),
      home: AuthScreen(),
    );
  }
}
