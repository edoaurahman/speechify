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

  Widget createAutoSizeText(String text,
      {double minFontSize = 0,
      double maxFontSize = 8,
      int maxLines = 1,
      TextStyle style = const TextStyle(fontWeight: FontWeight.bold)}) {
    return AutoSizeText(
      text,
      minFontSize: minFontSize,
      maxFontSize: maxFontSize,
      maxLines: maxLines,
      style: style,
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
          image: ResizeImage(
            AssetImage('assets/images/background2.webp'),
            height: 1080,
          ),
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
                childAspectRatio: 1.0,
                padding: const EdgeInsets.all(35.0),
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Aksi yang akan dijalankan saat card diklik
                      navigateWithSlideAnimation(
                          context,
                          const Pengertian(
                            pathText: 'assets/text/lungs.txt',
                            image:
                                'assets/images/deskripsi_alat_ucap/lungs.webp',
                            title: 'Paru-paru (Lungs)',
                          ));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Flexible(
                            child: Image(
                              image: ResizeImage(
                                AssetImage(
                                    'assets/images/deskripsi_alat_ucap/lungs.webp'),
                                height: 186,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          createAutoSizeText('Paru-paru'),
                          Container(height: 10)
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigateWithSlideAnimation(
                          context,
                          const Pengertian(
                            pathText: 'assets/text/laring.txt',
                            image:
                                'assets/images/deskripsi_alat_ucap/laring.webp',
                            title: 'Pangkal Tenggorokan (Laring)',
                          ));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Flexible(
                            child: Image(
                              image: ResizeImage(
                                AssetImage(
                                    'assets/images/deskripsi_alat_ucap/laring.webp'),
                                width: 186,
                                height: 186,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          createAutoSizeText('Pangkal Tenggorokan'),
                          Container(height: 10)
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigateWithSlideAnimation(
                          context,
                          const Pengertian(
                            pathText: 'assets/text/faring.txt',
                            image:
                                'assets/images/deskripsi_alat_ucap/faring.webp',
                            title: 'Rongga kerongkongan (Faring)',
                          ));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Flexible(
                            child: Image(
                              image: ResizeImage(
                                AssetImage(
                                    'assets/images/deskripsi_alat_ucap/faring.webp'),
                                width: 186,
                                height: 186,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          createAutoSizeText('Rongga Kerongkongan'),
                          Container(height: 10)
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigateWithSlideAnimation(
                          context,
                          const Pengertian(
                            pathText: 'assets/text/venum.txt',
                            image:
                            'assets/images/deskripsi_alat_ucap/venum.webp',
                            title: 'Langit-langit Lunak (Venum)',
                          ));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Flexible(
                            child: Image(
                              image: ResizeImage(
                                AssetImage(
                                    'assets/images/deskripsi_alat_ucap/venum.webp'),
                                width: 186,
                                height: 186,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          createAutoSizeText('Langit-langit lunak'),
                          Container(height: 10)
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navigateWithSlideAnimation(
                          context,
                          const Pengertian(
                            pathText: 'assets/text/palatum.txt',
                            image:
                            'assets/images/deskripsi_alat_ucap/venum.webp',
                            title: 'Langit-langit keras (Palatum)',
                          ));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Flexible(
                            child: Image(
                              image: ResizeImage(
                                AssetImage(
                                    'assets/images/deskripsi_alat_ucap/venum.webp'),
                                width: 186,
                                height: 186,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          createAutoSizeText('Langit-langit keras'),
                          Container(height: 10)
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
