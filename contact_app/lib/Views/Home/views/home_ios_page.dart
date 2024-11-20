import 'package:contact_app/Views/Home/provider/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeIosPage extends StatefulWidget {
  const HomeIosPage({super.key});

  @override
  State<HomeIosPage> createState() => _HomeIosPageState();
}

class _HomeIosPageState extends State<HomeIosPage> {
  late HomeProvider hr;
  late HomeProvider hw;
  double index = 0;
  @override
  Widget build(BuildContext context) {
    hr = context.read<HomeProvider>();
    hw = context.watch<HomeProvider>();
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Home Page'),
        trailing: CupertinoButton(
          padding: const EdgeInsets.all(5),
          child: const Icon(
            CupertinoIcons.add,
            color: Colors.teal,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/ios_contact');
          },
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListView.builder(
              itemCount: hw.contactList.length,
              itemBuilder: (context, index) {
                return CupertinoListTile(
                  title: Text("${hw.contactList[index].name}"),
                  leading: const Icon(CupertinoIcons.person),
                  trailing: const Icon(CupertinoIcons.ellipsis_vertical),
                  onTap: () {
                    Navigator.pushNamed(context, '/ios_contact_detail',
                        arguments: hw.contactList[index]);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
