import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class PetunjukPenggunaan extends StatelessWidget {
  const PetunjukPenggunaan({Key? key}) : super(key: key);

  double calculateFontSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // Sesuaikan dengan ukuran font yang diinginkan
    double fontSize = screenWidth * 0.035;
    return fontSize;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Petunjuk Penggunaan'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ResizeImage(
              const AssetImage('assets/images/background1.webp'),
              height: MediaQuery.of(context).size.height.toInt() + 200,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Html(data: """
<style>
body{
  padding: 0;
  margin: 0;
}
p {
  text-align: justify-all;
  font-weight: bold;
  padding: 0;
}
li {
  text-align: left;
  font-weight: bold;
}
ol{
  padding: 0;
  margin: 0;
}
</style>
<body>
  <p>Selamat datang di aplikasi ALUMA (Alat Ucap Manusia). Aplikasi ini akan membantu Anda memahami apa itu "Alat Ucap Manusia" beserta fungsi-fungsinya.</p>
  <ol>
    <li>Aplikasi ini memiliki 5 menu utama:
    <ul>
      <li>Petunjuk Penggunaan: Menampilkan petunjuk penggunaan aplikasi ini.</li>
      <li>ALUMA: Menampilkan informasi tentang ALUMA.</li>
      <li>Deskripsi Alat Ucap: Menyediakan penjelasan tentang berbagai alat yang digunakan dalam produksi suara manusia.</li>
      <li>QUIZ: Menyediakan kuis untuk menguji pengetahuan Anda tentang "Alat Ucap Manusia".</li>
      <li>Daftar Pustaka: Menampilkan daftar pustaka yang relevan dengan "Alat Ucap Manusia".</li>
    </ul>
    </li>
    <li>Pada menu "Deskripsi Alat Ucap", Anda akan menemukan sub-menu yang akan mempermudah Anda dalam mempelajari materi tentang "Alat Ucap Manusia".</li>
    <li>Pada menu "QUIZ", Anda dapat melakukan tes pengetahuan tentang "Alat Ucap Manusia".</li>
  </ol>
</body>
            """)
          ),
        ),
      ),
    );
  }
}
