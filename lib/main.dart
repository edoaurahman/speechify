import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speechify/screens/home_screen.dart';
import 'package:speechify/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const YourApp());
}

class YourApp extends StatelessWidget {
  const YourApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speechify',
      theme: ThemeData(
        primarySwatch: createMaterialColor(const Color(0xfffffe90)),
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        return PageRouteBuilder(
          settings: settings,
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation, Widget child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            // Daftar halaman dengan animasi fade in
            if (settings.name == '/') {
              return const SplashScreen();
            } else if (settings.name == '/home') {
              return const HomeScreen();
            } else {
              // Halaman lainnya
              return Container();
            }
          },
        );
      },
    );
  }
}
MaterialColor createMaterialColor(Color color) {
  final List<double> strengths = <double>[.05];
  final Map<int, Color> swatch = <int, Color>{};
  final int primary = color.value;
  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (final double strength in strengths) {
    final int ds = (0.5 - strength).round() * 0x100;
    swatch[(strength * 1000).round()] = Color(primary + ds);
  }
  return MaterialColor(color.value, swatch);
}