import 'package:flutter/material.dart';
import 'tools/sign_up_tools.dart';
import 'package:flutter/cupertino.dart';

class SignUpApp extends StatelessWidget {
  SignUpApp({super.key});
  var _name = "Thomas";
  var _email = "Brebis";
  var _password = "pyt";
  var button = ButtonConnection(name: "", email: "", password: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                height: 470,
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
                        "Create your count",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      // const SizedBox(height: 30,),
                      // FirstNameInputField(),
                      // const SizedBox(height: 12,),
                      // LastNameInputField(),
                      // const SizedBox(height: 12,),
                      // EmailInputField(),
                      // const SizedBox(height: 12,),
                      // PasswordInputField(),
                      const LoginAlready(),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: CupertinoTextField(
                              placeholder: "Email",
                              onChanged: (value) {
                                _email = value;
                                button.email = _email;
                              })),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: CupertinoTextField(
                              placeholder: "Password",
                              obscureText: true,
                              onChanged: (value) {
                                _password = value;
                                button.password = _password;
                              })),
                      button,
                      // ButtonConnection(
                      //     name: _name, email: _email, password: _password),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
