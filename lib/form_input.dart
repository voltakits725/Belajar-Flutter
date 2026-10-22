import 'package:flutter/material.dart';

class LatihanForm extends StatefulWidget {
  @override
  _LatihanFormState createState() => _LatihanFormState();
}

class _LatihanFormState extends State<LatihanForm> {
  // 1. Membuat Kunci Global untuk Form
  final _formKey = GlobalKey<FormState>();

  // 2. Membuat Controller untuk menangkap isi input
  final TextEditingController _tugasController = TextEditingController();

  // Fungsi yang dipanggil saat tombol Simpan ditekan
  void _simpanData() {
    // 3. Menjalankan validasi. Jika semua TextFormField lolos (return null), maka isValid = true
    if (_formKey.currentState!.validate()) {
      // Jika lolos validasi, ambil teksnya dari controller
      String tugasBaru = _tugasController.text;
      
      // Munculkan pesan sukses (Snack bar di bawah layar)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Berhasil menyimpan: $tugasBaru')),
      );
      
      // Kosongkan inputan setelah disimpan
      _tugasController.clear();
    }
  }

  @override
  void dispose() {
    // Wajib menghapus controller saat halaman ditutup agar memori tidak bocor (memory leak)
    _tugasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Materi Form & Validasi')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        // 4. Membungkus input dengan widget FORM
        child: Form(
          key: _formKey, // Pasang kunci form-nya di sini
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 5. TEXTFORMFIELD: Inputan yang mendukung validasi
              TextFormField(
                controller: _tugasController,
                decoration: InputDecoration(
                  labelText: 'Nama Tugas',
                  hintText: 'Contoh: Belajar API',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.task), // Icon di dalam kolom input
                ),
                
                // 6. VALIDATOR: Aturan kondisi input
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tugas tidak boleh kosong bro!'; // Pesan error jika kosong
                  }
                  if (value.length < 3) {
                    return 'Minimal 3 huruf dong!'; // Pesan error jika terlalu pendek
                  }
                  return null; // Return null berarti AMAN / Lolos validasi
                },
              ),
              const SizedBox(height: 20),
              
              SizedBox(
                width: double.infinity, // Tombol melebar penuh (seperti MediaQuery/Expanded)
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: _simpanData, // Panggil fungsi simpan
                  child: const Text('Simpan Tugas', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}