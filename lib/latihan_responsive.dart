import 'package:flutter/material.dart';

class LatihanResponsive extends StatelessWidget {
  const LatihanResponsive({super.key});
  @override
  Widget build(BuildContext context) {
    // 1. MEDIAQUERY: Mengambil informasi lebar dan tinggi layar device saat ini
    double lebarLayar = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan Layout Responsive'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // ==========================================
            // CONTOH 1: MEDIAQUERY
            // ==========================================
            Container(
              // Kotak ini akan selalu berukuran 80% dari lebar layar HP apa pun
              width: lebarLayar * 0.9, 
              height: 80,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Lebar 80% Layar (MediaQuery)',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            
            const SizedBox(height: 30), // Jarak

            // ==========================================
            // CONTOH 2: EXPANDED
            // ==========================================
            Row(
              children: [
                Container(
                  width: 100, // Ukuran pasti (fixed)
                  height: 60,
                  color: Colors.redAccent,
                  alignment: Alignment.center,
                  child: const Text('Lebar 100', style: TextStyle(color: Colors.white)),
                ),
                // Expanded akan memaksa kotak hijau melar mengambil SELURUH sisa ruang di sebelah kotak merah
                Expanded(
                  child: Container(
                    height: 60,
                    color: Colors.green,
                    alignment: Alignment.center,
                    child: const Text('Expanded (Makan Sisa Ruang)', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30), // Jarak

            // ==========================================
            // CONTOH 3: PERBEDAAN FLEXIBLE VS EXPANDED
            // ==========================================
            Row(
              children: [
                // Flexible membiarkan ukuran kotaknya sebesar isinya saja (tidak dipaksa melar mentok)
                // Tapi mencegah error overflow kalau teksnya kepanjangan
                Flexible(
                  child: Container(
                    height: 60,
                    color: Colors.orange,
                    alignment: Alignment.center,
                    child: const Text('Flexible', style: TextStyle(color: Colors.white)),
                  ),
                ),
                
                const SizedBox(width: 10), // Jarak tengah
                
                // Expanded akan memaksa melar mentok mengambil semua sisa ruang yang ditinggalkan Flexible
                Expanded(
                  child: Container(
                    height: 60,
                    color: Colors.purple,
                    alignment: Alignment.center,
                    child: const Text('Expanded', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}