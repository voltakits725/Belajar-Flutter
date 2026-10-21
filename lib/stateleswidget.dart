import 'package:flutter/material.dart';

class KartuNama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.blue,
      // Tampilan teks ini akan terus "Budi" dan tidak bisa diubah lewat interaksi
      child: const Text(
        'Halo, Nama Saya Budi!',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}