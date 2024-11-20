import 'package:contact_app/Ios_Navigation/provider/navigation_provider.dart';
import 'package:contact_app/Views/Contact/ios_contact_page.dart';
import 'package:contact_app/Views/Home/views/home_ios_page.dart';
import 'package:contact_app/Views/Profile/view/profile_ios.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IosNavigationBar extends StatefulWidget {
  const IosNavigationBar({super.key});

  @override
  State<IosNavigationBar> createState() => _IosNavigationBarState();
}

class _IosNavigationBarState extends State<IosNavigationBar> {
  List page = [
    const HomeIosPage(),
    const IosContractPage(),
    const ProfileIos(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: Colors.teal,
        onTap: (value) {
          context.read<NavigationProvider>().changeIndex(value);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_badge_plus), label: 'Contact'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled), label: 'Profile'),
        ],
      ),
      tabBuilder: (context, index) {
        return page[index];
      },
    );
  }
}
