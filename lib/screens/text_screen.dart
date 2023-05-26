import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class TextScreen extends StatefulWidget {
  const TextScreen({Key? key}) : super(key: key);

  @override
  TextScreenState createState() => TextScreenState();
}

class TextScreenState extends State<TextScreen>
    with SingleTickerProviderStateMixin {
  final int characterLimit = 900;
  late Future<List<String>> paginatedTextsFuture;
  int currentPage = 0;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  Future<List<String>> _loadTextFromAsset() async {
    final String text = await rootBundle.loadString('assets/text/file.txt');
    return _paginateText(text, characterLimit);
  }

  List<String> _paginateText(String text, int limit) {
    List<String> paginatedTexts = [];
    List<String> words = text.split(' ');

    String currentPageText = '';
    for (int i = 0; i < words.length; i++) {
      String word = words[i];

      if (currentPageText.length + word.length + 1 <= limit) {
        currentPageText += ' $word';
      } else {
        paginatedTexts.add(currentPageText.trim());
        currentPageText = word;
      }
    }

    // Add the last text to the last page if it's not empty
    if (currentPageText.isNotEmpty) {
      paginatedTexts.add(currentPageText.trim());
    }

    return paginatedTexts;
  }

  @override
  void initState() {
    super.initState();
    paginatedTextsFuture = _loadTextFromAsset();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
  }

  void _nextPage() {
    paginatedTextsFuture.then((paginatedTexts) {
      if (currentPage < paginatedTexts.length - 1) {
        setState(() {
          currentPage++;
        });
        _animationController.reset();
        _animationController.forward();
      }
    });
  }

  void _previousPage() {
    if (currentPage > 0) {
      setState(() {
        currentPage--;
      });
      _animationController.reset();
      _animationController.forward();
    }
  }

  double calculateFontSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // Adjust it to the desired font size
    double fontSize = screenWidth * 0.04;
    return fontSize;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double fontSize = calculateFontSize(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pendahuluan'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: FutureBuilder<List<String>>(
                  future: paginatedTextsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final paginatedTexts = snapshot.data!;
                      return AnimatedBuilder(
                        animation: _fadeAnimation,
                        builder: (context, child) {
                          return Opacity(
                            opacity: _fadeAnimation.value,
                            child: child,
                          );
                        },
                        child: Center(
                          child: Text(
                            paginatedTexts[currentPage],
                            style: TextStyle(fontSize: fontSize),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return const Text('Error loading text');
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RawMaterialButton(
                  onPressed: _previousPage,
                  shape: const CircleBorder(),
                  elevation: 2,
                  splashColor: Colors.transparent,
                  fillColor: Colors.deepPurpleAccent,
                  highlightColor: Colors.transparent,
                  child: const Icon(
                    CupertinoIcons.chevron_left_circle,
                    color: Colors.limeAccent,
                  ),
                ),
                FutureBuilder<List<String>>(
                  future: paginatedTextsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final paginatedTexts = snapshot.data!;
                      return Text(
                        '${currentPage + 1}/${paginatedTexts.length}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                RawMaterialButton(
                  onPressed: _nextPage,
                  shape: const CircleBorder(),
                  elevation: 2,
                  splashColor: Colors.transparent,
                  fillColor: Colors.deepPurpleAccent,
                  highlightColor: Colors.transparent,
                  child: const Icon(
                    CupertinoIcons.chevron_right_circle,
                    color: Colors.limeAccent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
