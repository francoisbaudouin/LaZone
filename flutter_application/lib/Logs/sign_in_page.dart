import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'sign_in_tools.dart';

class LoginCards extends StatelessWidget {
  LoginCards({super.key});
  var button = ButtonConnection(email: "", password: "");
  @override
  Widget build(BuildContext context) {
    return Container(
           padding: const EdgeInsets.only(left:15.0),
           decoration: const BoxDecoration(
               image: DecorationImage(
                   image: AssetImage("assets/images/parchemin.png"),
                   fit: BoxFit.fitHeight,
               ),
           ),
           child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 100,
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
                        color: Color.fromARGB(255, 64, 65, 68),
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
                            button.email = value;
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
                            ),
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
                            button.password = value;
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
                    const ForgottenPassword(),
                    button,
                    const CreateAccount(),
                    const ButtonService(),
                    const SizedBox(
                      height: 100,
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
            image: AssetImage("assets/images/f2.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          child: SingleChildScrollView(
          child: Column(
            children: const <Widget>[
              SizedBox(
                height: 60,
              ),
              LoginPageContent(),
            ],
          ),
        )),
      ),
    );
  }
}
