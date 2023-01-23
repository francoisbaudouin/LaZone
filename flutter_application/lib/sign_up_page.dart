import 'package:flutter/material.dart';
import 'tools/sign_up_tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpApp extends StatelessWidget {
  SignUpApp({super.key});
  var _firstname = "";
  var _lastname = "";
  var _email = "";
  var _password = "";
  var button = ButtonCreateAccount(firstname: "", lastname: "", email: "", password: "");

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
                      const SizedBox(height: 13,),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container( 
                          width: 260,
                          height: 60,
                          child: TextField(
                            onChanged: (value) {
                                _firstname = value;
                                button.firstname = _firstname;
                            },
                            decoration: const InputDecoration(
                              suffix: Icon(FontAwesomeIcons.user,color: Colors.red,),
                              labelText: "First Name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                              )
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container( 
                          width: 260,
                          height: 60,
                          child: TextField(
                            onChanged: (value) {
                                _lastname = value;
                                button.lastname = _lastname;
                              },
                            decoration: const InputDecoration(
                              suffix: Icon(FontAwesomeIcons.user,color: Colors.red,),
                              labelText: "Last Name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                              )
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container( 
                          width: 260,
                          height: 60,
                          child: TextField(
                            onChanged: (value) {
                                _email = value;
                                button.password = _email;
                              },
                            decoration: const InputDecoration(
                              suffix: Icon(FontAwesomeIcons.user,color: Colors.red,),
                              labelText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                              )
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container( 
                          width: 260,
                          height: 60,
                          child: TextField(
                            obscureText: true,
                            onChanged: (value) {
                                _password = value;
                                button.email = _password;
                              },
                            decoration: const InputDecoration(
                              suffix: Icon(FontAwesomeIcons.user,color: Colors.red,),
                              labelText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                              )
                            ),
                          ),
                        ),
                      ),
                      const LoginAlready(),
                      button,
                      // ButtonConnection(
                      //     name: _firstname, email: _email, password: _password),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
