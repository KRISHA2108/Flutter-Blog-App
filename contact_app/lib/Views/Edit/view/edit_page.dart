import 'dart:io';
import 'package:contact_app/Views/Home/model/home_model.dart';
import 'package:contact_app/Views/Home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ContactModel model =
        ModalRoute.of(context)!.settings.arguments as ContactModel;

    nameController.text = model.name!;
    emailController.text = model.email!;
    phoneController.text = model.phone!;
    context.watch<HomeProvider>().imagePath;
    return Scaffold(
      appBar: AppBar(
          title: const Text('Edit',
              style:
                  TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.teal,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.teal.shade200,
                      radius: 100,
                      backgroundImage: FileImage(
                        File(
                          context.watch<HomeProvider>().imagePath ??
                              model.image.toString(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ImagePicker()
                          .pickImage(source: ImageSource.gallery)
                          .then((value) {
                        setState(() {
                          context.read<HomeProvider>().imagePath = value!.path;
                        });
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Choose Image'),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      // hintText: "${model.name}",
                      labelText: 'Name',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      labelText: 'Phone',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.teal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.40,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.teal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          model.name = nameController.text;
                          model.email = emailController.text;
                          model.phone = phoneController.text;
                          model.image = context.read<HomeProvider>().imagePath;

                          context.read<HomeProvider>().editContact(model);
                          Navigator.pop(context);
                        },
                        child: const Text('Update'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
