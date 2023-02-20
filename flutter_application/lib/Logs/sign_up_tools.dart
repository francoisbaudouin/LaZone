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
      required this.password_});
  String firstname_;
  String lastname_;
  String pseudo_;
  String email_;
  String password_;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        bool isValid = EmailValidator.validate(email_);
        if (isValid) {
          user.firstname = firstname_;
          user.lastname = lastname_;
          user.email = email_;
          user.pseudo = pseudo_;
          signup(firstname_, lastname_, pseudo_, email_, password_, context);
        } else {
            throw Exception('Failed to login.');
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 250,
        decoration: const BoxDecoration(
             image: DecorationImage(
                   image: AssetImage("assets/images/but.jpg"),
                   fit: BoxFit.fitWidth,
               ),),
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            'Create account',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "OldLondon"),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: const Text(
              "Already sign in ?",
              style: TextStyle(color: Color.fromARGB(255, 74, 8, 136), fontFamily: "OldLondon", fontSize: 20),
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
    Map<String, dynamic> data = json.decode(response.body);
    connectedUser = data["data"]["user"];
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const MyHomePage(title: "LaZone")),
    );
  } else {
    throw Exception('Failed to create account.');
  }
}
