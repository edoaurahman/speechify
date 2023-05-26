import 'package:flutter/material.dart';
import 'package:speechify/screens/petunjuk_penggunaan.dart';
import 'package:speechify/screens/text_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
    const cardFont = 12.0;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
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
              left: 16,
              right: 16,
              top: screenHeight / 5,
            ),
            child: const Text(
              '''BAHAN AJAR
KETERAMPILAN MENULIS AKADEMIK BERORIENTASI BERPIKIR TINGGI''',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'PermanentMarker',
                fontWeight: FontWeight.w500,
                color: Colors.white,
                decoration:
                    TextDecoration.none, // Menghapus dekorasi garis bawah
              ),
            ), // Sesuaikan dengan tinggi teks
          ),
          // Bagian bawah dengan daftar kartu yang dapat di-scroll
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height /
                    2, // Sesuaikan dengan tinggi daftar kartu
                child: GridView.count(
                  crossAxisCount: 2,
                  // Jumlah kolom dalam grid
                  childAspectRatio: 1.0,
                  // Menjaga rasio aspek persegi
                  padding: const EdgeInsets.all(30.0),
                  // Padding pada grid
                  mainAxisSpacing: 50.0,
                  // Spasi antar item di sepanjang sumbu utama (vertikal)
                  crossAxisSpacing: 30.0,
                  // Spasi antar item di sepanjang sumbu lintang (horizontal)
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Aksi yang akan dijalankan saat card diklik
                        navigateWithSlideAnimation(
                            context, const PetunjukPenggunaanScreen());
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/card/petunjuk.png',
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Petunjuk Penggunaan',
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
                        // Aksi yang akan dijalankan saat card diklik
                        navigateWithSlideAnimation(context, const TextScreen());
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/card/deskripsi.png',
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Deskripsi Bahan Ajar',
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
                        // Aksi yang akan dijalankan saat card diklik
                        print('Card 1 clicked!');
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/card/petunjuk.png',
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Petunjuk Penggunaan',
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
                        // Aksi yang akan dijalankan saat card diklik
                        print('Card 2 clicked!');
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/card/petunjuk.png',
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Deskripsi Bahan Ajar',
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
                        // Aksi yang akan dijalankan saat card diklik
                        print('Card 1 clicked!');
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/card/petunjuk.png',
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Petunjuk Penggunaan',
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
                        // Aksi yang akan dijalankan saat card diklik
                        print('Card 2 clicked!');
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/card/petunjuk.png',
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Deskripsi Bahan Ajar',
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
                        // Aksi yang akan dijalankan saat card diklik
                        print('Card 1 clicked!');
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/card/petunjuk.png',
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Petunjuk Penggunaan',
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
                        // Aksi yang akan dijalankan saat card diklik
                        print('Card 2 clicked!');
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/card/petunjuk.png',
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Deskripsi Bahan Ajar',
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
                        // Aksi yang akan dijalankan saat card diklik
                        print('Card 1 clicked!');
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/card/petunjuk.png',
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Petunjuk Penggunaan',
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
                        // Aksi yang akan dijalankan saat card diklik
                        print('Card 2 clicked!');
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/card/petunjuk.png',
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Deskripsi Bahan Ajar',
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
          ),
        ],
      ),
    );
  }
}
