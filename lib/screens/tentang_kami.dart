import 'package:flutter/material.dart';

class TentangKami extends StatelessWidget {
  const TentangKami({Key? key}) : super(key: key);

  double calculateFontSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // Sesuaikan dengan ukuran font yang diinginkan
    double fontSize = screenWidth * 0.035;
    return fontSize;
  }

  @override
  Widget build(BuildContext context) {
    double fontSize = calculateFontSize(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Tentang Kami'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Text(
              '''
Pastikan Anda telah memperbarui aplikasi ke versi terbaru sebelum menggunakan.
Pilih menu pengaturan untuk mengatur preferensi penggunaan aplikasi.
Untuk memulai, tekan tombol "Mulai" pada halaman utama.
Ikuti langkah-langkah yang ditampilkan pada layar.
Jika mengalami kesulitan, jangan ragu untuk menghubungi tim dukungan kami.
Pastikan Anda membaca dan memahami syarat dan ketentuan penggunaan aplikasi.
Berikan umpan balik Anda untuk membantu kami meningkatkan kualitas aplikasi.
              ''',
              textAlign: TextAlign.justify,
              style: TextStyle(fontFamily: 'Poppins',fontSize: fontSize),
            ),
          ),
        ),
      ),
    );
  }
}
