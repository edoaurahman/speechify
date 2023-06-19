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

  Widget showImage(String path) {
    return Flexible(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Image(
          image: ResizeImage(
            AssetImage(path),
            height: 186,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery.of(context).size.width / 6;
    final screenHeight = MediaQuery.of(context).size.height;
    var appBar = AppBar(
      centerTitle: true,
      title: const Text("Deskripsi Alat Ucap"),
    );
    return Scaffold(
      appBar:appBar,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ResizeImage(
              const AssetImage('assets/images/background2.webp'),
              height: MediaQuery.of(context).size.height.toInt() + 100,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Bagian atas dengan teks
            Container(
              height: (MediaQuery.of(context).size.height - appBar.preferredSize.height - 80) /
                  2, // Sesuaikan dengan tinggi teks
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                left: padding,
                right: padding,
                top: (screenHeight - appBar.preferredSize.height - 80) / 14,
              ),
              child: const AutoSizeText(
                'Alat ucap adalah alat yang digunakan untuk menghasilkan bunyi-bunyi bahasa yang memiliki fungsi utama bersifat fisiologis, misalnya paru-paru untuk bernafas, lidah untuk mengecap dan gigi untuk mengunyah. Namun alat tersebut secara linguistik digunakan untuk menghasilkan bunyi-bunyi bahasa sewaktu berujar.',
                maxLines: 12,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.black54,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w100,
                    fontFamily: 'Poppins'),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: (MediaQuery.of(context).size.height) /
                      2,
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    childAspectRatio: 1.0,
                    padding: const EdgeInsets.all(70.0),
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
                              showImage(
                                  'assets/images/deskripsi_alat_ucap/lungs.webp'),
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
                              showImage(
                                  'assets/images/deskripsi_alat_ucap/laring.webp'),
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
                              showImage(
                                  'assets/images/deskripsi_alat_ucap/faring.webp'),
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
                              showImage(
                                  'assets/images/deskripsi_alat_ucap/venum.webp'),
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
                              showImage(
                                  'assets/images/deskripsi_alat_ucap/venum.webp'),
                              createAutoSizeText('Langit-langit keras'),
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
                                pathText: 'assets/text/alveolum.txt',
                                image:
                                    'assets/images/deskripsi_alat_ucap/ceruk.webp',
                                title: 'Ceruk Gigi (alveolum)',
                              ));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              showImage(
                                  'assets/images/deskripsi_alat_ucap/ceruk.webp'),
                              createAutoSizeText('Ceruk Gigi'),
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
                                pathText: 'assets/text/aritenoid.txt',
                                image:
                                    'assets/images/deskripsi_alat_ucap/aritenoid.webp',
                                title: 'Aritenoid',
                              ));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              showImage(
                                  'assets/images/deskripsi_alat_ucap/aritenoid.webp'),
                              createAutoSizeText('Aritenoid'),
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
                                pathText: 'assets/text/epiglotis.txt',
                                image:
                                    'assets/images/deskripsi_alat_ucap/epiglotis.webp',
                                title: 'Epiglotis',
                              ));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              showImage(
                                  'assets/images/deskripsi_alat_ucap/epiglotis.webp'),
                              createAutoSizeText('Epiglotis'),
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
                                pathText: 'assets/text/lidah.txt',
                                image:
                                    'assets/images/deskripsi_alat_ucap/lidah.webp',
                                title: 'Lidah',
                              ));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              showImage(
                                  'assets/images/deskripsi_alat_ucap/lidah.webp'),
                              createAutoSizeText('Lidah'),
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
                                pathText: 'assets/text/anak_tekak.txt',
                                image:
                                    'assets/images/deskripsi_alat_ucap/anak_tekak.webp',
                                title: 'Anak Tekak',
                              ));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              showImage(
                                  'assets/images/deskripsi_alat_ucap/anak_tekak.webp'),
                              createAutoSizeText('Anak Tekak'),
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
                                pathText: 'assets/text/gigi.txt',
                                image:
                                    'assets/images/deskripsi_alat_ucap/gigi.webp',
                                title: 'Gigi',
                              ));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16.0),
                                  child: const Image(
                                    image: ResizeImage(
                                      AssetImage(
                                          'assets/images/deskripsi_alat_ucap/gigi.webp'),
                                      height: 186,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              createAutoSizeText('Gigi'),
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
                                pathText: 'assets/text/bibir_atas.txt',
                                image:
                                    'assets/images/deskripsi_alat_ucap/bibir.webp',
                                title: 'Bibir Atas',
                              ));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              showImage(
                                  'assets/images/deskripsi_alat_ucap/bibir.webp'),
                              createAutoSizeText('Bibir Atas'),
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
                                pathText: 'assets/text/bibir_bawah.txt',
                                image:
                                    'assets/images/deskripsi_alat_ucap/bibir.webp',
                                title: 'Bibir Bawah',
                              ));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              showImage(
                                  'assets/images/deskripsi_alat_ucap/bibir.webp'),
                              createAutoSizeText('Bibir Bawah'),
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
                                pathText: 'assets/text/mulut.txt',
                                image:
                                    'assets/images/deskripsi_alat_ucap/mulut.webp',
                                title: 'Mulut',
                              ));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              showImage(
                                  'assets/images/deskripsi_alat_ucap/mulut.webp'),
                              createAutoSizeText('Mulut'),
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
                                pathText: 'assets/text/rongga_mulut.txt',
                                image:
                                    'assets/images/deskripsi_alat_ucap/venum.webp',
                                title: 'Rongga Mulut',
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
                              createAutoSizeText('Rongga Mulut'),
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
                                pathText: 'assets/text/rongga_hidung.txt',
                                image:
                                    'assets/images/deskripsi_alat_ucap/hidung.webp',
                                title: 'Rongga Hidung',
                              ));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              showImage(
                                  'assets/images/deskripsi_alat_ucap/hidung.webp'),
                              createAutoSizeText('Rongga Hidung'),
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
            ),
          ],
        ),
      ),
    );
  }
}
