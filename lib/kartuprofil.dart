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



class LatihanListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Warna latar belakang layar
      appBar: AppBar(
        title: const Text('Proyek Minggu 2: ListView'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      // 1. LISTVIEW: Membungkus semua kartu agar bisa di-scroll
      body: ListView(
        padding: const EdgeInsets.all(20), // Memberi jarak agar tidak menempel ke tepi layar
        children: [
          
          // ==========================================
          // KARTU 1: KARTU PROFIL (Versi Simpel)
          // ==========================================
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                const Text(
                  'Rafly',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Calon Fullstack Flutter Developer',
                  style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text('Semester: 5', style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 20),
                    Text('Fokus: Mobile', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),

          // Memberi jarak kosong antara Kartu 1 dan Kartu 2
          const SizedBox(height: 30),

          // ==========================================
          // KARTU 2: KARTU STATUS REPOSITORY
          // ==========================================
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blueGrey[900], // Background gelap sesuai desainmu
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri
              children: [
                const Text(
                  'Day One',
                  style: TextStyle(
                    color: Colors.amber, // Warna kuning keemasan
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Belajar Mobile Flutter',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    // Icon tambahan yang tadi kita bahas
                    const Icon(
                      Icons.code, 
                      color: Colors.white70,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Github: ',
                      style: TextStyle(color: Colors.redAccent, fontSize: 16),
                    ),
                    const Text(
                      'Voltakits725',
                      style: TextStyle(
                        color: Colors.lightBlue, 
                        fontSize: 16, 
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        elevation: 5, // Mengatur tebal bayangan (efek melayang 3D)
        color: Colors.blue[50], // Warna latar belakang kartu
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Mengatur lengkungan sudut
        ),
        // Karena Card ga punya fitur padding bawaan, kita tambahkan widget Padding di sini
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'Rafly',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Calon Fullstack Flutter Developer',
                style: TextStyle(fontSize: 16, color: Colors.blueGrey),
              ),
            ],
          ),
        ),
      )
    );
  }
}