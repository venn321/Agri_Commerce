import '../../../faq_page.dart';
import 'welcome_back_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
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
                  backgroundImage: AssetImage('assets/images/profile_pic.png'),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: ElevatedButton.icon(
                //       onPressed: imageP,
                //       icon: const Icon(Icons.add_a_photo_sharp),
                //       label: const Text('Upload Image')),
                // ),
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
