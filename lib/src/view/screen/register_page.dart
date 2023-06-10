import 'package:flutter/material.dart';
import 'welcome_back_page.dart';
import 'package:e_commerce_flutter/api_connection/api_connection.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> _handleRegister() async {
    String name = nameController.text;
    String Username = usernameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    AuthService authService = AuthService();
    try {
      await authService.register(name, Username, email, password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => WelcomeBackPage(),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                Icons.close,
                color: Colors.white,
                size: 40,
              ),
              Text(
                e.toString(),
                style: TextStyle(fontSize: 8),
              ),
            ],
          ),
          duration: Duration(seconds: 5),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.red, width: 2.0),
          ),
          backgroundColor: Colors.red,
          elevation: 5.0,
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          action: SnackBarAction(
            label: 'Dismiss',
            textColor: Colors.white,
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget title = Text(
      'Register',
      style: TextStyle(
          color: Colors.white,
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
          shadows: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              offset: Offset(0, 5),
              blurRadius: 10.0,
            )
          ]),
    );

    Widget subTitle = Padding(
        padding: const EdgeInsets.only(right: 56.0),
        child: Text(
          'Daftar sekarang juga !',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ));

    Widget registerButton = Positioned(
      left: MediaQuery.of(context).size.width / 5,
      bottom: 45,
      child: InkWell(
        onTap: () {
          _handleRegister();
          // Navigator.of(context)
          // .push(MaterialPageRoute(builder: (_) => WelcomeBackPage()));
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 80,
          child: Center(
              child: new Text("Register",
                  style: const TextStyle(
                      color: const Color(0xfffefefe),
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0))),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 18, 94, 32),
                    Color.fromARGB(255, 18, 94, 32),
                    Color.fromARGB(255, 18, 94, 32)
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  offset: Offset(0, 5),
                  blurRadius: 10.0,
                )
              ],
              borderRadius: BorderRadius.circular(9.0)),
        ),
      ),
    );

    Widget registerForm = Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width / 1.15,
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87)),
                        prefixIcon:
                            Icon(Icons.person_outline_rounded, size: 25),
                        hintText: "Masukkan Nama Anda Disini",
                        hintStyle: TextStyle(color: Colors.black87),
                        labelText: "Nama",
                        labelStyle: TextStyle(color: Colors.black87)),
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87)),
                        prefixIcon:
                            Icon(Icons.person_outline_rounded, size: 25),
                        hintText: "Masukkan username",
                        hintStyle: TextStyle(color: Colors.black87),
                        labelText: "Username",
                        labelStyle: TextStyle(color: Colors.black87)),
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87)),
                        prefixIcon:
                            Icon(Icons.person_outline_outlined, size: 25),
                        hintText: "Masukkan Email Anda Disini",
                        hintStyle: TextStyle(color: Colors.black87),
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.black87)),
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87)),
                        prefixIcon: Icon(Icons.password, size: 30),
                        hintText: "Masukkan Password",
                        hintStyle: TextStyle(color: Colors.black87),
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.black87)),
                    style: TextStyle(fontSize: 16.0),
                    obscureText: true,
                  ),
                ),
              ],
            ),
          ),
          registerButton,
        ],
      ),
    );

    Widget socialRegister = Column(
      children: <Widget>[
        Center(
          child: Text(
            'Mayasari',
            style: TextStyle(
                fontSize: 12.0,
                fontStyle: FontStyle.italic,
                color: Colors.white),
          ),
        ),
        // Widget lainnya
      ],
    );

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(96, 189, 77, 0.698),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Spacer(flex: 3),
                title,
                Spacer(),
                subTitle,
                Spacer(flex: 2),
                registerForm,
                Spacer(flex: 2),
                Padding(
                    padding: EdgeInsets.only(bottom: 20), child: socialRegister)
              ],
            ),
          ),
          Positioned(
            top: 35,
            left: 5,
            child: IconButton(
              color: Colors.white,
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
