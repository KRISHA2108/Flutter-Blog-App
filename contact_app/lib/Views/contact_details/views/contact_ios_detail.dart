import 'dart:io';
import 'package:contact_app/Views/Home/model/home_model.dart';
import 'package:contact_app/Views/Home/provider/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactIosDetail extends StatefulWidget {
  const ContactIosDetail({super.key});

  @override
  State<ContactIosDetail> createState() => _ContactIosDetailState();
}

class _ContactIosDetailState extends State<ContactIosDetail> {
  @override
  Widget build(BuildContext context) {
    ContactModel contactModel =
        ModalRoute.of(context)!.settings.arguments as ContactModel;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Contact Detail'),
        trailing: CupertinoButton(
            padding: const EdgeInsets.all(5),
            child: const Icon(CupertinoIcons.ellipsis_vertical),
            onPressed: () {
              showCupertinoModalPopup(
                  context: context,
                  builder: (context) {
                    return CupertinoActionSheet(
                      actions: [
                        CupertinoActionSheetAction(
                          child: const Text('Edit'),
                          onPressed: () {
                            Navigator.pushNamed(context, '/ios_contact_detail',
                                arguments: contactModel);
                          },
                        ),
                        CupertinoActionSheetAction(
                          child: const Text('Delete'),
                          onPressed: () {
                            context
                                .read<HomeProvider>()
                                .hideContact(contactModel);
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  });
            }),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 90),
            Center(
              child: (contactModel.image == null)
                  ? CircleAvatar(
                      backgroundColor: Colors.teal.shade200,
                      radius: 80,
                      backgroundImage: FileImage(
                        File(contactModel.image.toString()),
                      ),
                    )
                  : const CircleAvatar(
                      backgroundColor: Colors.teal,
                      radius: 80,
                      child: Icon(
                        Icons.person,
                        size: 100,
                        color: Colors.white,
                      ),
                    ),
            ),
            const SizedBox(height: 20),
            CupertinoContextMenuAction(
              child: CupertinoListTile(
                title: const Text(
                  "Name",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                trailing: const Icon(
                  CupertinoIcons.person,
                  color: Colors.teal,
                ),
                subtitle: Text(
                  contactModel.name.toString(),
                  style: const TextStyle(
                    color: CupertinoColors.systemGrey2,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            CupertinoContextMenuAction(
              child: CupertinoListTile(
                title: const Text(
                  "Email",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                trailing: IconButton(
                  onPressed: () {
                    // launchUrl(Uri(scheme: 'mailto', path: contactModel.email));
                  },
                  icon: const Icon(
                    CupertinoIcons.mail,
                    color: Colors.teal,
                  ),
                ),
                subtitle: Text(
                  contactModel.email.toString(),
                  style: const TextStyle(
                      color: CupertinoColors.systemGrey2, fontSize: 18),
                ),
              ),
            ),
            CupertinoContextMenuAction(
              child: CupertinoListTile(
                title: const Text("Phone", style: TextStyle(fontSize: 16)),
                trailing: IconButton(
                  onPressed: () {
                    // launchUrl(Uri(scheme: 'tel', path: contactModel.phone));
                  },
                  icon: const Icon(
                    CupertinoIcons.phone,
                    color: Colors.teal,
                  ),
                ),
                subtitle: Text(
                  contactModel.phone.toString(),
                  style: const TextStyle(
                    color: CupertinoColors.systemGrey2,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            CupertinoContextMenuAction(
              child: CupertinoListTile(
                title:
                    const Text("Share Contact", style: TextStyle(fontSize: 16)),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.share_up,
                    color: Colors.teal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
