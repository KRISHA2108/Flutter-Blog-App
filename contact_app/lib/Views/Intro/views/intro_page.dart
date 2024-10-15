import 'package:contact_app/Utils/Helper/shr_hepler.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        next: const Text("Next"),
        done: const Text("Done"),
        onDone: () {
          ShrIntroHelper shrIntroHelper = ShrIntroHelper();
          shrIntroHelper.introShown();
          Navigator.pushReplacementNamed(context, '/home');
        },
        pages: [
          PageViewModel(
            title: "Welcome",
            body: "Contact with us",
            image: Image.asset("lib/assets/images/talking.png"),
            decoration: const PageDecoration(
              titleTextStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          PageViewModel(
            title: "Welcome",
            body: "Contact with us",
            image: Image.asset("lib/assets/images/contact.png"),
            decoration: const PageDecoration(
              titleTextStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
