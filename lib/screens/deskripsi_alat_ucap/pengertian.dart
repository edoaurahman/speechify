import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_html/flutter_html.dart';

class Pengertian extends StatefulWidget {
  final String image, title, pathText;

  const Pengertian(
      {super.key,
      required this.image,
      required this.title,
      required this.pathText});

  @override
  PengertianState createState() => PengertianState();
}

class PengertianState extends State<Pengertian> {
  String text = '';

  @override
  void initState() {
    super.initState();
    _loadTextFromFile();
  }

  Future<void> _loadTextFromFile() async {
    final String fileText = await rootBundle.loadString(widget.pathText);
    setState(() {
      text = fileText;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget html = Html(data: text,shrinkWrap: true,);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: ResizeImage(
              AssetImage('assets/images/background3.webp'),
              height: 1080,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image(
                      image: ResizeImage(
                        AssetImage(widget.image),
                        height: 400,
                      ),
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(height: 20),
                  Card(
                    // Set the shape of the card using a rounded rectangle border with a 8 pixel radius
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    // Set the clip behavior of the card
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    // Define the child widgets of the card
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Add a container with padding that contains the card's title, text, and buttons
                        Container(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              html
                            ],
                          ),
                        ),
                        // Add a small space between the card and the next widget
                        Container(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
