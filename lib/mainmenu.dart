import 'package:flutter/material.dart';
import 'package:uts_pemmobile/Laporan_Pemasukan.dart';
import 'package:uts_pemmobile/about.dart';
import 'package:uts_pemmobile/laporan_pengeluaran.dart';
import 'package:uts_pemmobile/pemasukan.dart';
import 'package:uts_pemmobile/pengeluaran.dart';
import 'package:uts_pemmobile/profile.dart';

class MainMenu extends StatefulWidget {
  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // Ketinggian header
        child: AppBar(
          title: Text('MYMONEY'),
          backgroundColor: Color.fromARGB(255, 77, 150, 205),
        ),
      ),
      bottomNavigationBar: PreferredSize(
        preferredSize: Size.fromHeight(20.0), // Ketinggian footer
        child: BottomAppBar(
          color: Color.fromARGB(255, 77, 150, 205),
          child: Container(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  
                  onPressed: () {},
                  icon: Icon(Icons.home_outlined),
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
                  icon: Icon(Icons.perm_identity),
                  tooltip: 'Profile',
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => About(),
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
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              AnimatedBuilder(
                animation: _animation,
                builder: (BuildContext context, Widget? child) {
                  return Transform.scale(
                    scale: _animation.value,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildImageWithText('gambar/uang2.jpg', ''),
                            _buildImageWithText('gambar/uang1.jpg', ''),
                            _buildImageWithText('gambar/uang3.jpg', ''),
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  );
                },
              ),
              Text('SELAMAT DATANG DI MYMONEY'),
              SizedBox(height: 20),
              MainMenuGrid(),
              
            ],
          ),
        ),
        
      ),
      
    );
  }
  

  Widget _buildImageWithText(String imagePath, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _buildImage(imagePath),
          SizedBox(height: 9),
          Text(text),
        ],
      ),
    );
  }

  Widget _buildImage(String imagePath) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(255, 77, 150, 205),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagePath,
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}


class MainMenuGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 3 / 2,
      shrinkWrap: true,
      children: [
        _buildMenuCard(context, 'Pemasukan', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Pemasukan()),
          );
        }),
        _buildMenuCard(context, 'Pengeluaran', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Pengeluaran()),
          );
        }),
        _buildMenuCard(context, 'Laporan Pemasukan', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LaporanPemasukan()),
          );
        }, icon: Icons.history), // Menggunakan icon history untuk Laporan Pemasukan
        _buildMenuCard(context, 'Laporan Pengeluaran', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LaopranPengeluaran()),
          );
        }, icon: Icons.history), // Menggunakan icon history untuk Laporan Pengeluaran
      ],
    );
  }

  Widget _buildMenuCard(BuildContext context, String title, Function onTap, {IconData? icon}) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Card(
        color: Color.fromARGB(255, 182, 229, 234),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 100,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon ?? Icons.attach_money, size: 30), // Menggunakan icon history jika tersedia, jika tidak, menggunakan icon attach_money
                  SizedBox(height: 5),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
