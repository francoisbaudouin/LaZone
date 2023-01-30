import 'package:flutter/material.dart';
import 'sign_up_tools.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpApp extends StatelessWidget {
  SignUpApp({super.key});
  var button = ButtonCreateAccount(
      firstname_: "", lastname_: "", pseudo_: "", email_: "", password: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 200,
              ),
              Container(
                width: 325,
                height: 600,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Create your account",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
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
                              button.password = value;
                            },
                            decoration: const InputDecoration(
                                suffix: Icon(
                                  FontAwesomeIcons.user,
                                  color: Colors.red,
                                ),
                                labelText: "Password",
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
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
