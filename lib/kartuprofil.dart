import 'package:flutter/material.dart';

class KartuProfilSimple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Center digunakan agar kartu kita posisinya pas di tengah layar
      body: Center(
        // 1. CONTAINER: Sebagai kotak kartu dengan warna dan sudut melengkung
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blue[100], // Warna latar kartu
            borderRadius: BorderRadius.circular(15), // Sudut membulat
          ),
          // 2. COLUMN: Menyusun teks dari atas ke bawah
          child: Column(
            mainAxisSize: MainAxisSize.min, // Agar tinggi kotak hanya seukuran isinya
            children: [
              // 3. TEXT: Nama dan Profesi
              const Text(
                'Rafly',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Calon Fullstack Flutter Developer',
                style: TextStyle(fontSize: 16, color: Colors.blueGrey),
              ),
              const SizedBox(height: 20), // Jarak kosong

              // 4. ROW: Menyusun teks info menyamping
              Row(
                mainAxisSize: MainAxisSize.min, // Agar lebar menyesuaikan isi
                children: const [
                  Text('Semester: 5', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 20), // Jarak horizontal antar teks
                  Text('Fokus: Mobile', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
        
      ),
    );
  }
}

class LatihanCard extends StatelessWidget {
  const LatihanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 2, 22, 32),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
              mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Day One',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  color: Colors.amber
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Belajar Mobile Flutter',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  color: Colors.white60
                ),
              ),
              SizedBox(height: 12,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.code_rounded, color: Colors.blueAccent, size: 30,),

                  SizedBox(width: 8),

                  Text(
                    'Github:',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                    ),
                  ),

                  SizedBox(width: 8),

                  Text(
                    'Voltakits725',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontStyle: FontStyle.italic
                    ),
                  )
                ],
              )
            ], 
          ),
        ),
      ) ,
    );
  }
}

class latihanListView extends StatelessWidget {
  const latihanListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}