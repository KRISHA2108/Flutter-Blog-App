import 'package:contact_app/Views/Home/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class HomeProvider with ChangeNotifier {
  List<ContactModel> contactList = [
    ContactModel(
      name: 'John',
      phone: '123456789',
      email: 'johndoe@com',
    ),
  ];
  List<ContactModel> hideList = [];
  String? imagePath;
  int selectedIndex = 0;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  void hideContact(ContactModel contactModel) {
    hideList.add(contactModel);
    contactList.removeAt(selectedIndex);
    notifyListeners();
  }

  void unHideContact(ContactModel contactModel, int index) {
    contactList.add(contactModel);
    hideList.removeAt(index);
    notifyListeners();
  }

  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void addContact(ContactModel contactModel) {
    contactList.add(contactModel);
    notifyListeners();
  }

  void removeContact(int index) {
    contactList.removeAt(index);
    notifyListeners();
  }

  void editContact(ContactModel contactModel) {
    contactList[selectedIndex] = contactModel;
  }

  Future<bool> openLock() async {
    LocalAuthentication auth = LocalAuthentication();
    bool canCheckBiometrics = await auth.canCheckBiometrics;
    bool isBiometricSupported = await auth.isDeviceSupported();

    if (canCheckBiometrics && isBiometricSupported) {
      List<BiometricType> availableBiometrics =
          await auth.getAvailableBiometrics();
      if (availableBiometrics.isEmpty) {
        return false;
      } else {
        return await auth.authenticate(
          localizedReason: 'Please authenticate to edit contact',
        );
      }
    } else {
      return false;
    }
  }

  void changeDate(DateTime date) async {
    selectedDate = date;
    notifyListeners();
  }

  void changeTime(TimeOfDay time) async {
    selectedTime = time;
    notifyListeners();
  }
}
