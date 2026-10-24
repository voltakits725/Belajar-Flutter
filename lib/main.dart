// import 'package:belajar_flutter_part2/button.dart';
// import 'package:belajar_flutter_part2/form_input.dart';
// import 'package:belajar_flutter_part2/kartuprofil.dart';
// import 'package:belajar_flutter_part2/latihan_responsive.dart';
// import 'package:belajar_flutter_part2/navigator.dart';
import 'package:belajar_flutter_part2/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main(){
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HalamanUtama(),
      
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'Halo Bro!',
        style: TextStyle(
          fontSize: 24, // Mengatur ukuran
          color: Colors.blue, // Mengatur warna
          fontWeight: FontWeight.bold, // Membuat cetak tebal
        ),
      )
    );
  }
}

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10), // jarak luar
        padding: const EdgeInsets.all(20), //jarak dalam
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(15),// bikin sudut melengkung
        ),
        child: const Text('Ini didalam kotak'),
      ),
    );
  }
}



class RowAndColumn extends StatelessWidget {
  const RowAndColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Susun di tengah secara vertikal
        crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri
        children: [
          Text('Baris Pertama'),
          Text('Baris Kedua'),
          
        ],
        
      
      ),
      
    );
  }
}



