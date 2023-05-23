import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

    _animationController.forward();

    // Menambahkan delay sementara pada SplashScreen
    Future.delayed(const Duration(seconds: 2), () {
      // Navigasi ke halaman berikutnya setelah SplashScreen selesai
      _checkFirstTimeOpen();
    });
  }

  Future<void> _checkFirstTimeOpen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTimeOpen = prefs.getBool('firstTimeOpen') ?? true;

    Future.delayed(Duration.zero, () {
      if (isFirstTimeOpen) {
        // Jika pertama kali membuka aplikasi, simpan status dan navigasikan ke landing screen
        prefs.setBool('firstTimeOpen', false).then((_) {
          Navigator.pushReplacementNamed(context, '/onboarding');
        });
      } else {
        // Jika bukan pertama kali membuka aplikasi, langsung navigasikan ke home screen
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: child,
            );
          },
          child: Image.asset(
            'assets/images/logo.png',
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
