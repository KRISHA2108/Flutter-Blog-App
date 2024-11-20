import 'dart:io';
import 'package:contact_app/Views/Home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HidePage extends StatefulWidget {
  const HidePage({super.key});

  @override
  State<HidePage> createState() => _HidePageState();
}

class _HidePageState extends State<HidePage> {
  @override
  Widget build(BuildContext context) {
    // ContactModel contactModel =
    //     ModalRoute.of(context)!.settings.arguments as ContactModel;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Hide Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: context.watch<HomeProvider>().hideList.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/contact_details',
                    arguments: context.read<HomeProvider>().hideList[index]);
              },
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: FileImage(
                  File(
                    context
                        .watch<HomeProvider>()
                        .hideList[index]
                        .image
                        .toString(),
                  ),
                ),
              ),
              title:
                  Text("${context.watch<HomeProvider>().hideList[index].name}"),
              subtitle: Text(
                  "${context.watch<HomeProvider>().hideList[index].phone}"),
              onLongPress: () {
                context.read<HomeProvider>().unHideContact(
                    context.read<HomeProvider>().hideList[index], index);
              },
            );
          },
        ),
      ),
    );
  }
}
