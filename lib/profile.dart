import 'package:flutter/material.dart';
import 'package:uts_pemmobile/about.dart';
import 'package:uts_pemmobile/mainmenu.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color.fromARGB(255, 77, 150, 205), // Warna header
      ),
      body: Container(
        child: Column(
          children: [
            Image.asset(
              'gambar/profile.png',
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Nama Lengkap'), Text('ABEL AMANDA MANOPO')],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Email'), Text('Abelamanda@gmail.com')],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('No HP'), Text('08122453674')],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Jurusan'), Text('Teknik Informatika')],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
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
