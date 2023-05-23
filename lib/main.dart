import 'package:flutter/material.dart';
import 'package:speechify/screens/home_screen.dart';
import 'package:speechify/screens/onboarding.dart';
import 'package:speechify/screens/splash_screen.dart';

void main() {
  runApp(const YourApp());
}

class YourApp extends StatelessWidget {
  const YourApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/onboarding': (context) => OnboardingPage(
              pages: [
                OnboardingPageModel(
                  title: 'Fast, Fluid and Secure',
                  description:
                      'Be Your Self And Never Surender',
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
            ),
        // Daftar rute halaman lainnya
      },
    );
  }
}
