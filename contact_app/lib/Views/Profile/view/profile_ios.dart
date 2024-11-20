import 'dart:io';

import 'package:contact_app/Views/Home/provider/home_provider.dart';
import 'package:contact_app/Views/Profile/provider/profile_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../Home/model/home_model.dart';

class ProfileIos extends StatefulWidget {
  const ProfileIos({super.key});

  @override
  State<ProfileIos> createState() => _ProfileIosState();
}

class _ProfileIosState extends State<ProfileIos> {
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    // ContactModel contactModel =
    //     ModalRoute.of(context)!.settings.arguments as ContactModel;
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Profile Page'),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 90),
            Center(
              child: GestureDetector(
                onTap: () async {
                  ImagePicker imagePicker = ImagePicker();

                  XFile? xfile = await imagePicker.pickImage(
                    source: ImageSource.gallery,
                    imageQuality: 100,
                  );
                  imagePath = xfile!.path;
                  setState(() {});
                },
                child: (imagePath == null)
                    ? const CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.teal,
                        child: Icon(
                          Icons.person,
                          size: 100,
                          color: Colors.white,
                        ),
                      )
                    : CircleAvatar(
                        radius: 80,
                        backgroundImage: FileImage(
                          File(imagePath!),
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 50),
            const CupertinoTextField(
              placeholder: "Enter Name",
              prefix: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(CupertinoIcons.person_solid, color: Colors.teal),
              ),
              keyboardType: TextInputType.name,
              padding: EdgeInsets.all(12),
            ),
            const SizedBox(height: 20),
            const CupertinoTextField(
              placeholder: "Enter Email",
              prefix: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(CupertinoIcons.mail_solid, color: Colors.teal),
              ),
              keyboardType: TextInputType.emailAddress,
              padding: EdgeInsets.all(12),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                const Icon(
                  CupertinoIcons.moon_circle,
                  color: Colors.teal,
                  size: 30,
                ),
                const SizedBox(width: 20),
                const Text(
                  "Dark Mode",
                  style: TextStyle(fontSize: 18, color: Colors.teal),
                ),
                const Spacer(),
                CupertinoSwitch(
                  value: context.watch<ProfileProvider>().isDark,
                  onChanged: (val) {
                    context.read<ProfileProvider>().changeTheme();
                  },
                )
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const Icon(
                  CupertinoIcons.device_phone_portrait,
                  color: Colors.teal,
                  size: 30,
                ),
                const SizedBox(width: 20),
                const Text(
                  "Platform ",
                  style: TextStyle(fontSize: 18, color: Colors.teal),
                ),
                const Spacer(),
                Consumer<ProfileProvider>(builder: (context, value, child) {
                  return CupertinoSwitch(
                    value: value.isAndroid,
                    onChanged: (value) {
                      context.read<ProfileProvider>().checkPlatform(value);
                    },
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
