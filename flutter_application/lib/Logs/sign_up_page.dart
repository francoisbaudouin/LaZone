import 'package:flutter/material.dart';
import 'sign_up_tools.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SignUpCards extends StatelessWidget {
  SignUpCards({super.key});
  var button = ButtonCreateAccount(
      firstname_: "", lastname_: "", pseudo_: "", email_: "", password_: "");

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: const EdgeInsets.only(left:15.0),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/parchemin2.png"),
                    fit: BoxFit.fitHeight,
                ),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 120,
                  ),
                  const Text(
                    "Create your account",
                    style: TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold, fontFamily: "OldLondon",),
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
                          button.firstname_ = value;
                        },
                        decoration: const InputDecoration(
                            suffix: Icon(
                              FontAwesomeIcons.user,
                              color: Colors.red,
                            ),
                            labelText: "First Name",
                            labelStyle: TextStyle(fontFamily: "OldLondon", color: Colors.black, fontSize: 25),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            )),
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
                          button.lastname_ = value;
                        },
                        decoration: const InputDecoration(
                            suffix: Icon(
                              FontAwesomeIcons.user,
                              color: Colors.red,
                            ),
                            labelText: "Last Name",
                            labelStyle: TextStyle(fontFamily: "OldLondon", color: Colors.black, fontSize: 25),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            )),
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
                          button.pseudo_ = value;
                        },
                        decoration: const InputDecoration(
                            suffix: Icon(
                              FontAwesomeIcons.user,
                              color: Colors.red,
                            ),
                            labelText: "Pseudo",
                            labelStyle: TextStyle(fontFamily: "OldLondon", color: Colors.black, fontSize: 25),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            )),
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
                          button.email_ = value;
                        },
                        decoration: const InputDecoration(
                            suffix: Icon(
                              FontAwesomeIcons.user,
                              color: Colors.red,
                            ),
                            labelText: "Email",
                            labelStyle: TextStyle(fontFamily: "OldLondon", color: Colors.black, fontSize: 25),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            )),
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
                          button.password_ = value;
                        },
                        decoration: const InputDecoration(
                            suffix: Icon(
                              FontAwesomeIcons.user,
                              color: Colors.red,
                            ),
                            labelText: "Password",
                            labelStyle: TextStyle(fontFamily: "OldLondon", color: Colors.black, fontSize: 25),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            )),
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
            image: AssetImage("assets/images/font.jpg"), fit: BoxFit.cover),
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