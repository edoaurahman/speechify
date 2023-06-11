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
            image: ResizeImage(
              AssetImage('assets/images/background1.webp'),
              height: 1500,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Text(
              '''
ALUMA ( Alat Ucap Manusia)

Anggota:
1. Fitri Miftahul Huda (22110011) 
2. Farra Gita Nandini (22110009) 
3. Redita Cahyani (22110041)
4. Vivi Putri Octavia (22110067)
5. Lovita Resa Rosita J. (22110017)
6.shoffiudin (22110042)
7. iksen saputra (22110052)

Pembimbing : 
Dr. Masnuatul Hawa M. Pd.
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
