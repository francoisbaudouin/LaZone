import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'sign_in_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../home_page.dart';
import '../Tools/text.dart';

class ButtonCreateAccount extends StatelessWidget {
  ButtonCreateAccount(
      {super.key,
      required this.firstname_,
      required this.lastname_,
      required this.pseudo_,
      required this.email_,
      required this.password});
  String firstname_;
  String lastname_;
  String pseudo_;
  String email_;
  String password;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        bool isValid = EmailValidator.validate(email_);
        if (isValid) {
          firstname = firstname_;
          lastname = lastname_;
          email = email_;
          pseudo = pseudo_;
          signup(firstname_, lastname_, pseudo_, email_, password, context);
        } else {
            throw Exception('Failed to login.');
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 250,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFF8A2387),
                  Color(0xFFE94057),
                  Color(0xFFF27121),
                ])),
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            'Create account',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class LoginAlready extends StatelessWidget {
  const LoginAlready({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SingInApp()),
              );
            },
            child: const Text(
              "Already sign in ?",
              style: TextStyle(color: Colors.deepOrange),
            ),
          )
        ],
      ),
    );
  }
}

signup(firstname, lastname, pseudo, email, password, context) async {
  var url = Uri.parse("http://localhost:8080/auth/signUp");
  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'firstname': firstname,
      'lastname': lastname,
      'pseudo': pseudo,
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 201) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const MyHomePage(title: "LaZone")),
    );
  } else {
    throw Exception('Failed to create account.');
  }
}
