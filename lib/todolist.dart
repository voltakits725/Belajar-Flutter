import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false, // Menghilangkan pita "DEBUG" di pojok kanan atas
    home: HalamanUtama(), // Menentukan halaman pertama yang dibuka saat aplikasi jalan
  ));
}

// ====================================================================
// HALAMAN 1: DAFTAR TUGAS (HALAMAN UTAMA)
// ====================================================================
// Kita pakai StatefulWidget karena isi layar ini akan berubah-ubah 
// (tugas bisa bertambah atau dihapus).
class HalamanUtama extends StatefulWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  _HalamanUtamaState createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  // Ini adalah "State" atau memori penyimpanan kita. 
  // Berupa List (daftar) yang isinya teks (String) kosong pada awalnya.
  List<String> daftarTugas = [];

  @override
  Widget build(BuildContext context) {
    // Scaffold: Kanvas utama Material Design untuk halaman ini
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List Proyek'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      
      // BODY: Bagian tengah aplikasi. 
      // Kita pakai logika pengecekan kondisi (IF-ELSE versi singkat yaitu ? dan :)
      body: daftarTugas.isEmpty 
          ? // JIKA KOSONG (?): Tampilkan teks peringatan di tengah layar
            const Center(
              child: Text(
                'Belum ada tugas. Yuk tambah sekarang!',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : // JIKA ADA ISINYA (:): Tampilkan daftar menggunakan ListView.builder
            // Kenapa builder? Karena dia akan merender item satu per satu sesuai jumlah data
            // secara dinamis, sangat cocok untuk daftar yang panjang biar gak error.
            ListView.builder(
              itemCount: daftarTugas.length, // Menghitung ada berapa banyak tugas di List
              itemBuilder: (context, index) {
                // itemBuilder akan me-looping dan membuatkan Card untuk setiap tugas
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  // ListTile: Widget bawaan Material yang rapi untuk baris daftar
                  child: ListTile(
                    leading: const Icon(Icons.task_alt, color: Colors.blueAccent), // Icon kiri
                    title: Text(daftarTugas[index]), // Mengambil teks sesuai urutan (index)
                    
                    // trailing: Bagian kanan ListTile. Kita isi tombol Hapus.
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.redAccent),
                        
                          onPressed: () {
                            // SETSTATE: Wajib dipanggil saat kita mengubah data!
                            // Ini yang menyuruh Flutter: "Woy, datanya berubah, gambar ulang layarnya!"
                            setState(() {
                              daftarTugas.removeAt(index); // Menghapus tugas berdasarkan urutannya
                            });
                          },
                        ),
                        // Tombol 1: Edit
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blueAccent),
                          onPressed: () {
                            // Logika untuk edit tugas nanti ditaruh di sini
                            print('Edit tugas dipencet');
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            
      // FAB: Tombol melayang di pojok kanan bawah
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add, color: Colors.white),
        // async & await: Karena kita pindah halaman dan butuh "menunggu" data dibawa balik
        onPressed: () async {
          // NAVIGASI PUSH: Melempar user ke HalamanTambah.
          // Hasil ketikan dari HalamanTambah akan ditangkap oleh variabel "tugasBaru"
          final tugasBaru = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HalamanTambah()),
          );

          // Pengecekan: Kalau user menekan tombol "Back" (tidak jadi isi form),
          // nilainya pasti null. Kalau ada isinya (tidak null), baru kita tambahkan.
          if (tugasBaru != null) {
            // SETSTATE lagi: Menyuruh layar menggambar ulang karena ada tugas baru masuk
            setState(() {
              daftarTugas.add(tugasBaru); // Memasukkan teks baru ke dalam memori List kita
            });
          }
        },
      ),
    );
  }
}

// ====================================================================
// HALAMAN 2: FORM TAMBAH TUGAS
// ====================================================================
class HalamanTambah extends StatefulWidget {
  const HalamanTambah({Key? key}) : super(key: key);

  @override
  _HalamanTambahState createState() => _HalamanTambahState();
}

class _HalamanTambahState extends State<HalamanTambah> {
  // _formKey: Ibarat "KTP" atau ID khusus untuk widget Form kita agar bisa divalidasi
  final _formKey = GlobalKey<FormState>();
  
  // _tugasController: Bertugas memantau dan menyimpan apapun yang diketik user di kolom input
  final TextEditingController _tugasController = TextEditingController();

  // dispose: Fungsi bawaan yang berjalan saat halaman dihancurkan (ditutup)
  @override
  void dispose() {
    _tugasController.dispose(); // Wajib! Membuang controller agar memori HP tidak bocor
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Tugas Baru'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        // FORM: Wadah pembungkus yang memegang sistem validasi
        child: Form(
          key: _formKey, // Memasang ID KTP tadi ke Form ini
          child: Column(
            children: [
              // TEXTFORMFIELD: Kolom input yang mendukung sistem validasi bawaan Form
              TextFormField(
                controller: _tugasController, // Menyambungkan alat pantau teks kita
                decoration: InputDecoration(
                  labelText: 'Nama Tugas',
                  hintText: 'Contoh: Belajar Routing Flutter',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Bikin kotaknya melengkung
                  ),
                ),
                // VALIDATOR: Aturan untuk mengecek inputan user sebelum disimpan
                validator: (value) {
                  // Kalau kosong, kembalikan pesan error ini. 
                  // TextFormField akan otomatis berubah jadi merah.
                  if (value == null || value.isEmpty) {
                    return 'Tugas tidak boleh kosong bro!';
                  }
                  return null; // Kalau lolos validasi (aman), kembalikan null
                },
              ),
              const SizedBox(height: 20), // Memberi jarak kosong sebelum tombol
              
              // SizedBox selebar layar (double.infinity) biar tombolnya memanjang
              SizedBox(
                width: double.infinity,
                // ELEVATEDBUTTON: Tombol utama bawaan Material Design
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {
                    // Cek validasi: Menjalankan semua aturan "validator" di dalam Form ini
                    if (_formKey.currentState!.validate()) {
                      // JIKA VALIDASI LOLOS:
                      // NAVIGASI POP: Tutup halaman ini, dan bawa kembali data teks
                      // (_tugasController.text) ke halaman sebelumnya (HalamanUtama).
                      Navigator.pop(context, _tugasController.text);
                    }
                  },
                  child: const Text('Simpan', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}