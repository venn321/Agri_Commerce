import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../../faq_page.dart';
import 'welcome_back_page.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _name = '';
  late String _imagePath = '';
  @override
  void _updateProfile() {
    //Simulasi logika untuk mengirim perubahan ke database

    //simulasi berhasil
    bool updateSuccess = true;

    if (updateSuccess) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green),
                SizedBox(width: 10),
                Text('Update Berhasil'),
              ],
            ),
            content: Text('Perubahan Berhasil Disimpan'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OKKKKEEE'))
            ],
          );
        },
      );
    } else {
      // sadagkdgaudasuhkasa
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final PickedFile = await picker.getImage(source: ImageSource.gallery);

    if (PickedFile != null) {
      setState(() {
        _imagePath = PickedFile.path;
      });
      //Gunakan pickedImage untuk mengakses path gambar yang mo dipilih
      //atau juga untuk melakukan operasi lain seperti mengunggah ke server
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.only(left: 16.0, right: 16.0, top: kToolbarHeight),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  maxRadius: 48,
                  backgroundImage:
                      _imagePath != null ? FileImage(File(_imagePath)) : null,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Rose Helbert',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  title: Text('FAQ'),
                  subtitle: Text('Questions and Answer'),
                  leading: Image.asset('assets/images/faq.png'),
                  trailing: Icon(Icons.chevron_right,
                      color: Color.fromRGBO(96, 189, 77, 0.698)),
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => FaqPage())),
                ),
                Divider(),
                ListTile(
                  title: Text('Log Out'),
                  subtitle: Text('logout'),
                  leading: Image.asset(
                    'assets/images/sign_out.png',
                    fit: BoxFit.scaleDown,
                    width: 30,
                    height: 30,
                  ),
                  trailing: Icon(Icons.chevron_right,
                      color: Color.fromRGBO(96, 189, 77, 0.698)),
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => WelcomeBackPage())),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
