import 'package:contact_app/Android_navigation/provider/bottom_navigation.dart';
import 'package:contact_app/Views/Contact/contact_page.dart';
import 'package:contact_app/Views/Home/views/home_page.dart';
import 'package:contact_app/Views/Profile/view/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

List page = [
  const HomePage(),
  const ContactPage(),
  const ProfilePage(),
];

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[context.watch<BottomNavigationProvider>().currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          context.read<BottomNavigationProvider>().changeIndex(value);
        },
        currentIndex: context.watch<BottomNavigationProvider>().currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add_alt_outlined),
            label: 'Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_sharp),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
