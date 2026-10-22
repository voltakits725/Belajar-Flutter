import 'package:flutter/material.dart';

class LatihanMaterial extends StatelessWidget {
  const LatihanMaterial({super.key});
  @override
  Widget build(BuildContext context) {
    // 1. SCAFFOLD: Kanvas utamanya
    return Scaffold(
      backgroundColor: Colors.white,

      // 2. APPBAR: Bagian kepala aplikasi
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white, // Warna teks & icon di dalam AppBar
        elevation: 4, // Ketebalan bayangan di bawah AppBar
        leading: const Icon(Icons.menu), // Icon di kiri
        title: const Text('Materi Material Widget'), // Judul
        actions: [
          // Icon di kanan (bisa lebih dari satu karena formatnya array [])
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              print('Notifikasi diklik!');
            },
          ),
        ],
      ),

      // BODY: Isi konten utama
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 3. ELEVATED BUTTON (Tombol Utama)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              onPressed: () {
                print('Tombol Simpan ditekan');
              },
              child: const Text('Simpan Data (Elevated)'),
            ),
            const SizedBox(height: 20),

            // 4. OUTLINED BUTTON (Tombol Sekunder)
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.blueAccent, width: 2),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              onPressed: () {
                print('Tombol Batal ditekan');
              },
              child: const Text('Batal (Outlined)'),
            ),
            const SizedBox(height: 20),

            // 5. TEXT BUTTON (Tombol Tersamar)
            TextButton(
              onPressed: () {
                print('Tombol Lupa Password ditekan');
              },
              child: const Text(
                'Lupa Password? (TextButton)',
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          ],
        ),
      ),

      // FLOATING ACTION BUTTON (Tombol Melayang di pojok)
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          print('FAB diklik!');
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}