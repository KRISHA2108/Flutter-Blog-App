import 'dart:io';
import 'package:contact_app/Views/Home/model/home_model.dart';
import 'package:contact_app/Views/Home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  String pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String? imagePath;

  late HomeProvider homeProviderR;
  late HomeProvider homeProviderW;
  @override
  Widget build(BuildContext context) {
    homeProviderR = context.read<HomeProvider>();
    homeProviderW = context.watch<HomeProvider>();
    RegExp regExp = RegExp(pattern);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.teal),
        ),
        title: const Text('Contact',
            style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  (imagePath == null)
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
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
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
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Name",
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Enter Name",
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Phone",
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 5),
              TextField(
                maxLength: 10,
                keyboardType: TextInputType.number,
                controller: phoneController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Enter Phone",
                  focusColor: Colors.white,
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email",
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 5),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Enter Email",
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  const Icon(Icons.calendar_month, color: Colors.teal),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "Date",
                    style: TextStyle(
                        color: Colors.teal,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      homeProviderR.changeDate(selectedDate!);
                    },
                    child: Text(
                      "${homeProviderR.selectedDate.day} - ${homeProviderR.selectedDate.month} - ${homeProviderR.selectedDate.year}",
                      style: const TextStyle(color: Colors.teal),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.schedule, color: Colors.teal),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "Time",
                    style: TextStyle(
                        color: Colors.teal,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () async {
                      TimeOfDay? selectedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      homeProviderR.changeTime(selectedTime!);
                    },
                    child: Text(
                      "${homeProviderR.selectedTime.hour} : ${homeProviderR.selectedTime.minute}",
                      style: const TextStyle(color: Colors.teal),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  String name = nameController.text;
                  String phone = phoneController.text;
                  String email = emailController.text;
                  String image = imagePath.toString();

                  ContactModel contactModel = ContactModel(
                    name: name,
                    phone: phone,
                    email: email,
                    image: imagePath.toString(),
                  );
                  context.read<HomeProvider>().addContact(contactModel);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                      content: Text("Added Successfully"),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.teal,
                  minimumSize: const Size.fromHeight(48),
                ),
                child: const Text(
                  "ADD",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
