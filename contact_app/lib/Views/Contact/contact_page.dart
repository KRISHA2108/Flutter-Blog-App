import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  int currentStep = 0;
  String? imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Stepper(
              onStepContinue: () {
                setState(() {
                  if (currentStep < 3) {
                    currentStep++;
                  }
                });
              },
              currentStep: currentStep,
              onStepCancel: () {
                setState(() {
                  if (currentStep > 0) {
                    currentStep--;
                  }
                });
              },
              steps: [
                Step(
                  title: const Text("Add Photo"),
                  content: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        child: (imagePath == null)
                            ? const CircleAvatar(
                                radius: 80,
                              )
                            : CircleAvatar(
                                radius: 80,
                                backgroundImage: FileImage(
                                  File(imagePath!),
                                ),
                              ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          ImagePicker imagePicker = ImagePicker();

                          XFile? image = await imagePicker.pickImage(
                            source: ImageSource.gallery,
                            imageQuality: 100,
                          );
                          setState(() {
                            imagePath = image!.path;
                          });
                        },
                        child: const Text("Upload"),
                      ),
                    ],
                  ),
                ),
                Step(
                  title: const Text("Name"),
                  content: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Step(
                  title: const Text("Number"),
                  content: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Step(
                  title: const Text("Email"),
                  content: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("SAVE"),
            ),
          ],
        ),
      ),
    );
  }
}
