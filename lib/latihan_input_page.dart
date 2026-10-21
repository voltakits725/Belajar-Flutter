import 'package:flutter/material.dart';

class LatihanInputPage extends StatefulWidget {
  const LatihanInputPage({super.key});

  @override
  State<LatihanInputPage> createState() => _LatihanInputPageState();
}

class _LatihanInputPageState extends State<LatihanInputPage> {
  // Variabel untuk menyimpan input teks
  String inputText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Input & DevTools')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Widget untuk menerima input teks dari user
            TextField(
              decoration: InputDecoration(
                labelText: 'Masukkan nama kamu',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
            
              
              ),
              
              onChanged: (value) {
                // setState memicu build ulang saat ada ketikan baru
                setState(() {
                  inputText = value;
                });
              },
            ),
            const SizedBox(height: 20),
            
            // Widget tombol
            ElevatedButton(
              onPressed: () {
                // Aksi ketika tombol ditekan
                print('Tombol ditekan, data terkirim: $inputText');
              },
              child: const Text('Kirim Data'),
            ),
            const SizedBox(height: 30),
            
            // Menampilkan hasil ketikan secara real-time
            Text(
              'Teks yang diketik: $inputText',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}