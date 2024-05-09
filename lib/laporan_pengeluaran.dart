import 'package:flutter/material.dart';

class LaopranPengeluaran extends StatefulWidget {
  const LaopranPengeluaran({super.key});

  @override
  State<LaopranPengeluaran> createState() => _LaopranPengeluaranState();
}

class _LaopranPengeluaranState extends State<LaopranPengeluaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laporan Pengeluaran'),
        backgroundColor: Color.fromARGB(255, 77, 150, 205),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, i) {
              return Card(
                child: ListTile(
                  title: Text('Digunakan Untuk Bayar-'),
                  subtitle: Text('Rp. 50000'),
                ),
              );
            }),
      ),
    );
  }
}
