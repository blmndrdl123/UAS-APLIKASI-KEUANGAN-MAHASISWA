import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uts_pemmobile/constans.dart';
import 'package:uts_pemmobile/login.dart';
import 'package:uts_pemmobile/mainmenu.dart';

class Launcher extends StatefulWidget {
  const Launcher({Key? key}) : super(key: key);

  @override
  State<Launcher> createState() => _LauncherState();
}

class _LauncherState extends State<Launcher>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation.addListener(() => setState(() {}));
    animationController.forward();
    startTime();
  }

  startTime() {
    var _duration = new Duration(seconds: 1);
    return new Timer(_duration, () {});
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(SPLASH_SCREEN);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 77, 150, 205)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'gambar/uang.jpeg',
                  width: animation.value * 200,
                  height: animation.value * 200,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => LoginApp()),
                    );
                  },
                  child: const Text(
                    'LOGIN',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
