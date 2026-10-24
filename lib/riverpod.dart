import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ====================================================================
// PILAR 1: GUDANG DATA & LOGIKA BISNIS (Notifier)
// ====================================================================
class GudangTugas extends Notifier<List<String>> {
  @override
  List<String> build() {
    return []; // Nilai awal saat aplikasi pertama kali jalan
  }

  void tambahTugas(String tugasBaru) {
    state = [...state, tugasBaru];
  }

  void hapusTugas(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i != index) state[i],
    ];
  }

  // Fungsi Edit: Copy data lama, timpa teksnya, lalu simpan sebagai state baru
  void editTugas(int index, String tugasBaru) {
    final listBaru = [...state]; 
    listBaru[index] = tugasBaru; 
    state = listBaru; 
  }
}

// ====================================================================
// PILAR 2: KUNCI PROVIDER
// ====================================================================
final tugasProvider = NotifierProvider<GudangTugas, List<String>>(() {
  return GudangTugas();
});

// ====================================================================
// MAIN APP & PILAR 3: PROVIDERSCOPE
// ====================================================================
void main() {
  runApp(
    // ProviderScope wajib membungkus seluruh aplikasi di paling luar
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HalamanUtama(),
    );
  }
}

// ====================================================================
// HALAMAN 1: DAFTAR TUGAS (CONSUMER WIDGET)
// ====================================================================
class HalamanUtama extends ConsumerWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Memantau gudang data, otomatis refresh layar kalau ada perubahan
    final daftarTugas = ref.watch(tugasProvider); 

    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List Riverpod (CRUD)'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: daftarTugas.isEmpty
          ? const Center(child: Text('Belum ada tugas.'))
          : ListView.builder(
              itemCount: daftarTugas.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: ListTile(
                    leading: const Icon(Icons.task_alt),
                    title: Text(daftarTugas[index]),
                    // Trailing memakai Row agar bisa menampung 2 tombol sejajar
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min, // Wajib! Biar gak error overflow
                      children: [
                        // Tombol Edit
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blueAccent),
                          onPressed: () {
                            _tampilkanDialogEdit(context, ref, index, daftarTugas[index]);
                          },
                        ),
                        // Tombol Hapus
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.redAccent),
                          onPressed: () {
                            ref.read(tugasProvider.notifier).hapusTugas(index);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
        onPressed: () async {
          // Buka Halaman Tambah dan tangkap hasil ketikannya
          final tugasBaru = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HalamanTambah()),
          );

          if (tugasBaru != null) {
            // Lempar data tugas baru ke gudang data Riverpod
            ref.read(tugasProvider.notifier).tambahTugas(tugasBaru);
          }
        },
      ),
    );
  }

  // ==========================================
  // FUNGSI BANTUAN: POP-UP DIALOG EDIT
  // ==========================================
  void _tampilkanDialogEdit(BuildContext context, WidgetRef ref, int index, String teksLama) {
    final editController = TextEditingController(text: teksLama);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Tugas'),
          content: TextField(
            controller: editController,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                if (editController.text.isNotEmpty) {
                  // Jalankan fungsi editTugas di gudang data, lalu tutup pop-up
                  ref.read(tugasProvider.notifier).editTugas(index, editController.text);
                  Navigator.pop(context);
                }
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }
}

// ====================================================================
// HALAMAN 2: FORM TAMBAH TUGAS (STATEFUL WIDGET)
// ====================================================================
class HalamanTambah extends StatefulWidget {
  const HalamanTambah({Key? key}) : super(key: key);

  @override
  _HalamanTambahState createState() => _HalamanTambahState();
}

class _HalamanTambahState extends State<HalamanTambah> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tugasController = TextEditingController();

  @override
  void dispose() {
    _tugasController.dispose();
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _tugasController,
                decoration: InputDecoration(
                  labelText: 'Nama Tugas',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tugas tidak boleh kosong bro!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Tutup layar ini dan bawa data teksnya balik ke Halaman Utama
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