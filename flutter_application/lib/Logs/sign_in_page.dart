import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'sign_in_tools.dart';
import '../Tools/global.dart';

class LoginCards extends StatelessWidget {
  LoginCards({super.key});
  final button = ButtonConnection();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(100, 0, 100, 40),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/parchemin.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 45.0),
            child: SizedBox(
              width: 260,
              height: 60,
              child: TextFormField(
                onChanged: (value) {
                  serverAddress = value;
                },
                initialValue: serverAddress,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(width: 1.5)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide:
                          BorderSide(width: 2, color: Colors.lightBlue)),
                  suffix:
                      Icon(FontAwesomeIcons.server, color: Colors.deepPurple),
                  labelText: "Server address",
                  labelStyle: TextStyle(
                      fontFamily: "OldLondon",
                      color: Colors.black,
                      fontSize: 25),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Hello",
            style: TextStyle(
              color: Colors.black,
              fontSize: 35,
              fontWeight: FontWeight.bold,
              fontFamily: "OldLondon",
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Sign in with your account",
            style: TextStyle(
              color: Color.fromARGB(255, 74, 8, 136),
              fontSize: 20,
              fontFamily: "OldLondon",
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(
              width: 260,
              height: 60,
              child: TextField(
                onChanged: (value) {
                  globalEmail = value;
                },
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(width: 1.5)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide:
                          BorderSide(width: 2, color: Colors.lightBlue)),
                  suffix: Icon(
                    FontAwesomeIcons.envelope,
                    color: Colors.deepPurple,
                  ),
                  labelText: "Email",
                  labelStyle: TextStyle(
                      fontFamily: "OldLondon",
                      color: Colors.black,
                      fontSize: 25),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(
              width: 260,
              height: 60,
              child: TextField(
                obscureText: true,
                onChanged: (value) {
                  globalPassword = value;
                },
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(width: 1.5)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide:
                          BorderSide(width: 2, color: Colors.lightBlue)),
                  suffix: Icon(
                    FontAwesomeIcons.key,
                    color: Colors.deepPurple,
                  ),
                  labelText: "Password",
                  labelStyle: TextStyle(
                      fontFamily: "OldLondon",
                      color: Colors.black,
                      fontSize: 25),
                ),
              ),
            ),
          ),
          const ForgottenPassword(),
          button,
          const CreateAccount(),
          const ButtonService(),
          const SizedBox(
            height: 120,
          ),
        ],
      ),
    );
  }
}

class LoginPageContent extends StatelessWidget {
  const LoginPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: SingleChildScrollView(
        child: ResponsiveRowColumn(
          layout: ResponsiveWrapper.of(context).isSmallerThan("DESKTOP")
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          rowCrossAxisAlignment: CrossAxisAlignment.center,
          columnCrossAxisAlignment: CrossAxisAlignment.center,
          rowSpacing: 25,
          columnSpacing: 25,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: 1,
              rowFit: FlexFit.loose,
              child: LoginCards(),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1920,
      width: 1080,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/font_menu.jpg"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SizedBox(
            width: 500,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    LoginPageContent(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
