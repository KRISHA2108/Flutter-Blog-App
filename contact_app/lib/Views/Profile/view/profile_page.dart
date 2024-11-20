import 'dart:io';
import 'package:contact_app/Views/Profile/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profile Page',
          style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
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
              const SizedBox(height: 40),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(
                    Icons.dark_mode,
                    color: Colors.teal,
                    size: 30,
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    'Dark Mode',
                    style: TextStyle(fontSize: 18, color: Colors.teal),
                  ),
                  const Spacer(),
                  Switch(
                    value: context.watch<ProfileProvider>().isDark,
                    onChanged: (value) {
                      context.read<ProfileProvider>().changeTheme();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(
                    Icons.phone_android_rounded,
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
                    return Switch(
                      value: value.isAndroid,
                      onChanged: (val) {
                        context.read<ProfileProvider>().checkPlatform(val);
                      },
                    );
                  }),
                ],
              ),
            ],
          )),
    );
  }
}
