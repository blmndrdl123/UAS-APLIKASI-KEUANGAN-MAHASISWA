import 'package:flutter/material.dart';

class LaporanPemasukan extends StatefulWidget {
  const LaporanPemasukan({super.key});

  @override
  State<LaporanPemasukan> createState() => _LaporanPemasukanState();
}

class _LaporanPemasukanState extends State<LaporanPemasukan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laporan Pemasukan'),
        backgroundColor: Color.fromARGB(255, 77, 150, 205),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, i) {
              return Card(
                child: ListTile(
                  title: Text('Hari ke-'),
                  subtitle: Text('Rp. 50000'),
                ),
              );
            }),
      ),
    );
  }
}
