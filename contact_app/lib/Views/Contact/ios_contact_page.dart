import 'dart:io';
import 'package:contact_app/Views/Home/model/home_model.dart';
import 'package:contact_app/Views/Home/provider/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class IosContractPage extends StatefulWidget {
  const IosContractPage({super.key});

  @override
  State<IosContractPage> createState() => _IosContractPageState();
}

class _IosContractPageState extends State<IosContractPage> {
  late HomeProvider homeProviderR;
  late HomeProvider homeProviderW;
  String? imagePath;
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    homeProviderR = context.read<HomeProvider>();
    homeProviderW = context.watch<HomeProvider>();
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: const Icon(
          CupertinoIcons.back,
          color: Colors.teal,
        ),
        middle: const Text('Contact '),
        trailing: CupertinoButton(
            padding: const EdgeInsets.all(10),
            onPressed: () {
              String name = nameController.text;
              String phone = numberController.text;
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
              Navigator.pop(context);
            },
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.teal, fontSize: 18),
            )),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
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
                          radius: 90,
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
              const SizedBox(height: 10),
              const CupertinoTextField(
                maxLength: 10,
                placeholder: "Enter Phone",
                prefix: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(CupertinoIcons.phone_solid, color: Colors.teal),
                ),
                keyboardType: TextInputType.phone,
                padding: EdgeInsets.all(12),
              ),
              const SizedBox(height: 10),
              const CupertinoTextField(
                placeholder: "Enter Email",
                prefix: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(CupertinoIcons.mail_solid, color: Colors.teal),
                ),
                keyboardType: TextInputType.emailAddress,
                padding: EdgeInsets.all(12),
              ),
              const SizedBox(height: 20),
              CupertinoButton(
                child: Row(
                  children: [
                    const Icon(CupertinoIcons.calendar, color: Colors.teal),
                    const SizedBox(width: 10),
                    const Text("Date", style: TextStyle(color: Colors.teal)),
                    const Spacer(),
                    Text(
                      "${context.watch<HomeProvider>().selectedDate.day}/${context.watch<HomeProvider>().selectedDate.month}/${context.watch<HomeProvider>().selectedDate.year}",
                      style: const TextStyle(color: Colors.teal),
                    ),
                  ],
                ),
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (builder) {
                      return Container(
                        height: 300,
                        color: Colors.black,
                        child: CupertinoDatePicker(
                          initialDateTime: DateTime.now(),
                          mode: CupertinoDatePickerMode.date,
                          onDateTimeChanged: (value) {
                            context.read<HomeProvider>().changeDate(value);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 10),
              CupertinoButton(
                child: Row(
                  children: [
                    const Icon(CupertinoIcons.clock, color: Colors.teal),
                    const SizedBox(width: 10),
                    const Text("Time", style: TextStyle(color: Colors.teal)),
                    const Spacer(),
                    Text(
                      "${context.watch<HomeProvider>().selectedTime.hour}:${context.watch<HomeProvider>().selectedTime.minute}",
                      style: const TextStyle(color: Colors.teal),
                    ),
                  ],
                ),
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (builder) {
                      return Container(
                        height: 300,
                        color: Colors.black,
                        child: CupertinoDatePicker(
                          initialDateTime: DateTime.now(),
                          mode: CupertinoDatePickerMode.time,
                          onDateTimeChanged: (value) {
                            context.read<HomeProvider>().changeTime(TimeOfDay(
                                hour: value.hour, minute: value.minute));
                          },
                        ),
                      );
                    },
                  );
                },
              ),
              // const SizedBox(height: 20),
              // CupertinoButton.filled(
              //   borderRadius: BorderRadius.circular(10),
              //   child: const Text("Save"),
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
