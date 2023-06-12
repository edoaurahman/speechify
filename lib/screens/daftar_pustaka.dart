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
  ];

  LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
