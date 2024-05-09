import 'package:flutter/material.dart';
import 'package:uts_pemmobile/launcher.dart';
import 'package:uts_pemmobile/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BUKU KEUANGAN MAHASISWA',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey),
        // Jika Anda menggunakan Flutter 2.x, perhatikan bahwa properti `useMaterial3` sudah tidak ada lagi.
      ),
      home: Launcher(),
    );
  }
}
