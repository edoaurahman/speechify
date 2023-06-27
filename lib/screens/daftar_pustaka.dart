import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  final List<Map<String, String>> references = [
    {
      'author': 'Jannah, R.',
      'title': 'Produksi Organ Bicara Bahasa Arab',
      'journal': 'AL-ISHLAH: Jurnal Pendidikan Islam',
      'volume': '17(1)',
      'pages': '71-84',
      'doi': 'https://doi.org/10.35905/alishlah.v17i1.988',
    },
    {
      'author': 'Sirait, A. M.',
      'title': 'Faktor risiko tumor/kanker rongga mulut dan tenggorokan di Indonesia (Analisis Riskesdas 2007)',
      'journal': 'Media Penelitian dan Pengembangan Kesehatan',
      'volume': '23(3)',
      'pages': '20813',
      'doi': 'https://doi.org/10.33541/mkvol34iss2pp60',
    },
    {
      'author': 'Yuliati, R, & Unsirah, F',
      'title': 'Fonologi',
      'publisher': 'Ub Press',
      'location': 'Malang',
    },
    {
      'author': 'WikiPedia',
      'title': 'Lelangit',
      'doi': 'https://id.m.wikipedia.org/wiki/Lelangit ',
    },
    {
      'author': 'Silmi Nurul Utami',
      'title': 'Struktur Laring Manusia Beserta Fungsinya',
      'doi': 'https://www.kompas.com/skola/read/2022/01/06/135446969/struktur-laring-manusia-beserta-fungsinya?amp=1&page=2',
    },
    {
      'author': 'dr. Rizal Fadli',
      'title': 'Ketahui Fungsi Rongga Mulut dalam Sistem Pencernaan Manusia',
      'doi': 'https://www.halodoc.com/artikel/ketahui-fungsi-rongga-mulut-dalam-sistem-pencernaan-manusia',
    },
    {
      'author': 'Μουχάμαντ Ιρφάν',
      'title': 'Alat ucap dan Fungsinya',
      'doi': 'https://muhmdirpan.wordpress.com/2018/03/02/alat-ucap-dan-fungsinya/',
    },
    {
      'author': 'Nasution, A. S. A .(2022).',
      'title': ' Fonetik dan Fonologi Alquran. ',
    },
  ];

  LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Daftar Pustaka'),
      ),
      body: ListView.builder(
        itemCount: references.length,
        itemBuilder: (context, index) {
          final reference = references[index];

          return ListTile(
            leading: const Icon(Icons.book),
            title: Text('${reference['author']}: ${reference['title']}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Journal: ${reference['journal'] ?? '' }'),
                Text('Volume: ${reference['volume'] ?? ''}'),
                Text('Pages: ${reference['pages'] ?? ''}'),
                if (reference.containsKey('doi'))
                  Text('DOI: ${reference['doi']}'),
                if (reference.containsKey('publisher'))
                  Text('Publisher: ${reference['publisher']}'),
                if (reference.containsKey('location'))
                  Text('Location: ${reference['location']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
