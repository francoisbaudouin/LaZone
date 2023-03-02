import 'package:flutter/material.dart';
import 'sign_up_tools.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../Tools/global.dart';

class SignUpCards extends StatelessWidget {
  SignUpCards({super.key});
  final button = ButtonCreateAccount();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15.0),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/parchemin2.png"),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
          Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 55.0),
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
                    borderSide: BorderSide(width: 2, color: Colors.lightBlue)),
                suffix: Icon(
                  FontAwesomeIcons.server,
                  color: Colors.deepPurple,
                ),
                labelText: "Server address",
                labelStyle: TextStyle(
                    fontFamily: "OldLondon", color: Colors.black, fontSize: 25),
              ),
            ),
          ),
        ),
        const Text(
          "Create your account",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontFamily: "OldLondon",
          ),
        ),
        const SizedBox(
          height: 13,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SizedBox(
            width: 260,
            height: 60,
            child: TextField(
              onChanged: (value) {
                globalFirstname = value;
              },
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(width: 1.5)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(width: 2, color: Colors.lightBlue)),
                suffix: Icon(
                  FontAwesomeIcons.user,
                  color: Colors.deepPurple,
                ),
                labelText: "First Name",
                labelStyle: TextStyle(
                    fontFamily: "OldLondon", color: Colors.black, fontSize: 25),
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
              onChanged: (value) {
                globalLastname = value;
              },
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(width: 1.5)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(width: 2, color: Colors.lightBlue)),
                suffix: Icon(
                  FontAwesomeIcons.user,
                  color: Colors.deepPurple,
                ),
                labelText: "Last Name",
                labelStyle: TextStyle(
                    fontFamily: "OldLondon", color: Colors.black, fontSize: 25),
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
              onChanged: (value) {
                globalPseudo = value;
              },
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(width: 1.5)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(width: 2, color: Colors.lightBlue)),
                suffix: Icon(
                  FontAwesomeIcons.user,
                  color: Colors.deepPurple,
                ),
                labelText: "Pseudo",
                labelStyle: TextStyle(
                    fontFamily: "OldLondon", color: Colors.black, fontSize: 25),
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
              onChanged: (value) {
                globalEmail = value;
              },
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(width: 1.5)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(width: 2, color: Colors.lightBlue)),
                suffix: Icon(
                  FontAwesomeIcons.envelope,
                  color: Colors.deepPurple,
                ),
                labelText: "Email",
                labelStyle: TextStyle(
                    fontFamily: "OldLondon", color: Colors.black, fontSize: 25),
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
                    borderSide: BorderSide(width: 2, color: Colors.lightBlue)),
                suffix: Icon(
                  FontAwesomeIcons.key,
                  color: Colors.deepPurple,
                ),
                labelText: "Password",
                labelStyle: TextStyle(
                    fontFamily: "OldLondon", color: Colors.black, fontSize: 25),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const LoginAlready(),
        const SizedBox(
          height: 5,
        ),
        button,
        const SizedBox(
          height: 125,
        ),
      ]),
    );
  }
}

class SignUpPageContent extends StatelessWidget {
  const SignUpPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: ResponsiveRowColumn(
          layout: ResponsiveWrapper.of(context).isSmallerThan("DESKTOP")
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          rowCrossAxisAlignment: CrossAxisAlignment.center,
          rowSpacing: 25,
          columnSpacing: 25,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: 1,
              rowFit: FlexFit.tight,
              child: SignUpCards(),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);
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
        body: SizedBox(
            child: SingleChildScrollView(
          child: Column(
            children: const <Widget>[
              SizedBox(
                height: 30,
              ),
              SignUpPageContent(),
            ],
          ),
        )),
      ),
    );
  }
}
