import 'dart:async';
import 'package:flutter/material.dart';
import '../../routes/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.sizeOf(context);
    Timer.periodic(
      const Duration(
        seconds: 3,
      ),
      (timer) {
        Navigator.of(context).pushReplacementNamed(Routes.homePage);
        timer.cancel();
      },
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Image.asset('lib/assets/gif/Playlist.gif',
              width: s.width * 0.8, height: s.height * 0.8, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
//2C3C42
