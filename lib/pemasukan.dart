import 'package:flutter/material.dart';

class Pemasukan extends StatefulWidget {
  const Pemasukan({Key? key});

  @override
  State<Pemasukan> createState() => _PemasukanState();
}

class _PemasukanState extends State<Pemasukan> {
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
        title: Text('Pemasukan'),
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
                labelText: 'Tulis catatan pemasukan anda',
                hintText: 'Tulis catatan pemasukan anda',
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _dateController,
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tanggal Pemasukan',
                hintText: 'Pilih tanggal pemasukan',
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
                labelText: 'Masukkan Nominal pemasukan anda',
                hintText: 'Masukkan Nominal pemasukan anda',
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
