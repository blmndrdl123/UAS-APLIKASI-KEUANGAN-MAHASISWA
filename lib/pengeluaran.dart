import 'package:flutter/material.dart';

class Pengeluaran extends StatefulWidget {
  const Pengeluaran({Key? key});

  @override
  State<Pengeluaran> createState() => _PengeluaranState();
}

class _PengeluaranState extends State<Pengeluaran> {
  late TextEditingController _dateController;

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController();
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null)
      setState(() {
        _dateController.text = pickedDate.toString(); // Mengubah format sesuai kebutuhan
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengeluaran'),
        backgroundColor: Color.fromARGB(255, 77, 150, 205),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            TextFormField(
              maxLines: 2,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tulis catatan pengeluaran anda',
                hintText: 'Tulis catatan pengeluaran anda',
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _dateController,
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tanggal Pengeluaran',
                hintText: 'Pilih tanggal pengeluaran',
                suffixIcon: IconButton(
                  onPressed: () => _selectDate(context),
                  icon: Icon(Icons.calendar_today),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              maxLines: 2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukkan Nominal pengeluaran anda',
                hintText: 'Masukkan Nominal pengeluaran anda',
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.orange[900],
              ),
              child: Center(
                child: Text(
                  "SIMPAN",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
