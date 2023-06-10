import 'package:e_commerce_flutter/api_connection/api_connection.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'register_page.dart';

class WelcomeBackPage extends StatefulWidget {
  @override
  _WelcomeBackPageState createState() => _WelcomeBackPageState();
}

class _WelcomeBackPageState extends State<WelcomeBackPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _handleLogin() async {
    String emailOrUsername = emailController.text;
    String password = passwordController.text;
    AuthService authService = AuthService();
    try {
      await authService.login(emailOrUsername, password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
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
    Widget welcomeBack = Text(
      'Hallo!',
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
          'Selamat Datang Kembali',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ));

    Widget loginButton = Positioned(
      left: 81.5,
      right: 81.5,
      bottom: 18,
      child: InkWell(
        onTap: () {
          _handleLogin();
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 1.5,
          height: 80,
          child: Center(
              child: new Text("Log In",
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

    Widget loginForm = Container(
      height: MediaQuery.of(context).size.height / 3.5,
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width / 1.15,
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.8),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87)),
                        prefixIcon:
                            Icon(Icons.person_outline_rounded, size: 25),
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
                        prefixIcon: Icon(Icons.password_outlined, size: 25),
                        hintText: "Masukkan Password Disini",
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
          loginButton,
        ],
      ),
    );

    Widget forgotPassword = Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Tidak punya akun?',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Color.fromRGBO(255, 255, 255, 0.5),
                fontSize: 14.0,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => RegisterPage()));
              },
              child: Text(
                'Daftar sekarang',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
            ),
          ],
        ),
      ),
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
              children: <Widget>[
                Spacer(flex: 3),
                welcomeBack,
                Spacer(),
                subTitle,
                Spacer(flex: 2),
                loginForm,
                Spacer(flex: 2),
                forgotPassword
              ],
            ),
          )
        ],
      ),
    );
  }
}
