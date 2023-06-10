import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:speechify/screens/deskripsi_alat_ucap/pengertian.dart';

class DeskripsiAlatUcap extends StatelessWidget {
  const DeskripsiAlatUcap({Key? key}) : super(key: key);

  void navigateWithSlideAnimation(BuildContext context, Widget destination) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => destination,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const cardFont = 8.0;
    const padding = 60.0;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background2.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          // Bagian atas dengan teks
          Container(
            height: MediaQuery.of(context).size.height /
                2, // Sesuaikan dengan tinggi teks
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              left: padding,
              right: padding,
              top: screenHeight / 14,
            ),
            child: const AutoSizeText(
              'Alat ucap adalah alat yang digunakan untuk menghasilkan bunyi-bunyi bahasa yang memiliki fungsi utama bersifat fisiologis, misalnya paru-paru untuk bernafas, lidah untuk mengecap dan gigi untuk mengunyah. Namun alat tersebut secara linguistik digunakan untuk menghasilkan bunyi-bunyi bahasa sewaktu berujar.',
              maxLines: 11,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black54,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w100,
                  fontFamily: 'Poppins'),
            ),
          ),
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              // Sesuaikan dengan tinggi daftar kartu
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                // Jumlah kolom dalam grid
                childAspectRatio: 1.0,
                // Menjaga rasio aspek persegi
                padding: const EdgeInsets.all(35.0),
                // Padding pada grid
                mainAxisSpacing: 10.0,
                // Spasi antar item di sepanjang sumbu utama (vertikal)
                crossAxisSpacing: 10.0,
                // Spasi antar item di sepanjang sumbu lintang (horizontal)
                children: [
                  GestureDetector(
                    onTap: () {
                      // Aksi yang akan dijalankan saat card diklik
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Pengertian(
                            pathText: 'assets/text/lungs.txt',
                            image: 'assets/images/deskripsi_alat_ucap/lungs.webp',
                            title: 'Lungs',
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Image.asset(
                              'assets/images/deskripsi_alat_ucap/lungs.webp',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Text(
                            'Lungs',
                            style: TextStyle(
                                fontSize: cardFont,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Pengertian(
                            pathText: 'assets/text/laring.txt',
                            image: 'assets/images/deskripsi_alat_ucap/laring.webp',
                            title: 'Laring',
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Image.asset(
                              'assets/images/deskripsi_alat_ucap/laring.webp',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Text(
                            'Laring',
                            style: TextStyle(
                                fontSize: cardFont,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Tambahkan card lain sesuai kebutuhan
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
