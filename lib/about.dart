import 'package:flutter/material.dart';
import 'package:uts_pemmobile/mainmenu.dart';
import 'package:uts_pemmobile/profile.dart';

class About extends StatefulWidget {
  const About({Key? key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        backgroundColor: Color.fromARGB(255, 77, 150, 205), // Warna header
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'gambar/uang.jpeg',
                width: 200,
                height: 200,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Aplikasi keuangan Mahasiswa '),
                    Text('Version 0.1'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 77, 150, 205), // Warna footer
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MainMenu(), // Ganti 'NextPage()' dengan halaman tujuan
                    ),
                  );
                },
                icon: Icon(Icons.add_home_outlined),
                tooltip: 'MENU',
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(),
                    ),
                  );
                },
                icon: Icon(Icons.add_moderator_outlined),
                tooltip: 'Profile',
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          About(), // Ganti 'NextPage()' dengan halaman tujuan
                    ),
                  );
                },
                icon: Icon(Icons.info),
                tooltip: 'About',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
