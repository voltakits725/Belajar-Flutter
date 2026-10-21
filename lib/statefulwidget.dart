import 'package:flutter/material.dart';

class TombolPenghitung extends StatefulWidget {
  @override
  _TombolPenghitungState createState() => _TombolPenghitungState();
}

class _TombolPenghitungState extends State<TombolPenghitung> {
  // Variabel penyimpan data (state)
  int angka = 0; 

  void tambahAngka() {
    // setState wajib dipanggil agar Flutter tahu ada data yang berubah dan UI harus di-refresh
    setState(() {
      angka++; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Teks ini akan berubah secara dinamis mengikuti nilai 'angka'
        Text(
          'Tombol ditekan: $angka kali', 
          style: const TextStyle(fontSize: 20),
        ),
        ElevatedButton(
          onPressed: tambahAngka, // Panggil fungsi saat ditekan
          child: const Text('Tambah'),
        ),
      ],
    );
  }
}