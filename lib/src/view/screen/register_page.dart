import 'package:flutter/material.dart';
import 'welcome_back_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
          'Daftar sekarang juga',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ));

    Widget registerButton = Positioned(
      left: MediaQuery.of(context).size.width / 4,
      bottom: 40,
      child: InkWell(
        onTap: () {
          registerUser();
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
      height: 300,
      child: Stack(
        children: <Widget>[
          Container(
            height: 220,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 32.0, right: 12.0),
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.8),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: usernameController,
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
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87)),
                        prefixIcon:
                            Icon(Icons.person_outline_outlined, size: 30),
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

  Future<void> registerUser() async {
    String email = emailController.text;
    String password = passwordController.text;
    String usename = usernameController.text;
  }
}
