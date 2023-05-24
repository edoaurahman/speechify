import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speechify/screens/home_screen.dart';
import 'package:speechify/screens/onboarding.dart';
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
        primarySwatch: Colors.yellow,
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
            } else if (settings.name == '/onboarding') {
              return OnboardingPage(
                pages: [
                  OnboardingPageModel(
                    title: 'Fast, Fluid and Secure',
                    description: 'Be Your Self And Never Surender',
                    image: 'assets/images/image0.png',
                    bgColor: Colors.indigo,
                  ),
                  OnboardingPageModel(
                    title: 'Connect with your friends.',
                    description: 'Tombol Surrender ada di pengaturan.',
                    image: 'assets/images/image1.png',
                    bgColor: const Color(0xff1eb090),
                  ),
                  OnboardingPageModel(
                    title: 'Bookmark your favourites',
                    description:
                    'Bookmark your favourite quotes to read at a leisure time.',
                    image: 'assets/images/image2.png',
                    bgColor: const Color(0xfffeae4f),
                  ),
                ],
              );
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
