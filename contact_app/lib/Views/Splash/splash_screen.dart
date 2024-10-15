import 'package:contact_app/Utils/Helper/shr_hepler.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

@override
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    ShrIntroHelper shrIntroHelper = ShrIntroHelper();

    shrIntroHelper.isIntroShown().then((value) {
      if (value == true) {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pushReplacementNamed(context, '/home');
        });
      } else {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pushReplacementNamed(context, '/intro');
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset("lib/assets/gif/Contact.gif"),
      ),
    );
  }
}
