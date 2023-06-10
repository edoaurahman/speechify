import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Pengertian ${widget.title}'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background3.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  widget.image,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
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
                            // Display the card's title using a font size of 24 and a dark grey color
                            Text(
                              widget.title,
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.grey[800],
                              ),
                            ),
                            // Add a space between the title and the text
                            Container(height: 10),
                            // Display the card's text using a font size of 15 and a light grey color
                            Text(
                              text,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[700],
                              ),
                            ),
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
    );
  }
}
