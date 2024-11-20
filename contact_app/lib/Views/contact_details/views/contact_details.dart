import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:contact_app/Views/Home/model/home_model.dart';
import 'package:contact_app/Views/Home/provider/home_provider.dart';

class ContactDetails extends StatefulWidget {
  const ContactDetails({super.key});

  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  @override
  Widget build(BuildContext context) {
    ContactModel contactModel =
        ModalRoute.of(context)!.settings.arguments as ContactModel;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.teal)),
        title: const Text(
          'Contact Details',
          style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/edit', arguments: contactModel);
            },
            icon: const Icon(Icons.edit, color: Colors.teal),
          ),
          IconButton(
            onPressed: () {
              context.read<HomeProvider>().hideContact(contactModel);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.lock, color: Colors.teal),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            child: (contactModel.image == null)
                ? CircleAvatar(
                    backgroundColor: Colors.teal.shade200,
                    radius: 100,
                    backgroundImage: FileImage(
                      File(contactModel.image.toString()),
                    ),
                  )
                : const CircleAvatar(
                    backgroundColor: Colors.teal,
                    radius: 100,
                    child: Icon(
                      Icons.person,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
          ),
          const SizedBox(height: 20),
          ListTile(
              title: const Text("Name",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.teal)),
              subtitle: Text("${contactModel.name}",
                  style: const TextStyle(fontSize: 18)),
              leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.person,
                    color: Colors.teal,
                  ))),
          const Divider(
            thickness: 2,
          ),
          ListTile(
            title: const Text("Phone",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.teal)),
            subtitle: Text(
              "${contactModel.phone}",
              style: const TextStyle(fontSize: 18),
            ),
            leading: const Icon(
              Icons.phone,
              color: Colors.teal,
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          ListTile(
            title: const Text(
              "Email",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.teal,
              ),
            ),
            subtitle: Text(
              "${contactModel.email}",
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            leading: const Icon(
              Icons.email,
              color: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }
}
