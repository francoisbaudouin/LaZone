import 'package:flutter/material.dart';
import 'package:flutter_application/Tools/text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:email_validator/email_validator.dart';
import 'sign_in_page.dart';
import 'sign_up_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../home_page.dart';

class ForgottenPassword extends StatelessWidget {
  const ForgottenPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              "Forgotten Password",
              style: TextStyle(color: Color.fromARGB(255, 74, 8, 136), fontFamily: "OldLondon", fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed : () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpPage()),
              );
            },
            child: const Text(
              "Click here to create a new account",
              style: TextStyle(color: Color.fromARGB(255, 74, 8, 136), fontFamily: "OldLondon", fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}

class ButtonConnection extends StatelessWidget {
  ButtonConnection({super.key, required this.email, required this.password});
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        bool isValid = EmailValidator.validate(email);
        if (isValid) {
            signin(email, password, context);
        } else {
            throw Exception('Failed to login.');
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 250,
        decoration: const BoxDecoration(
            image: DecorationImage(
                   image: AssetImage("assets/images/button.jpg"),
                   fit: BoxFit.fitWidth,
               ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(50.0),
          child: Text(
            'Connection',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "OldLondon"),
          ),
        ),
      ),
    );
  }
}

class ButtonService extends StatelessWidget {
  const ButtonService({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            icon: const Icon(FontAwesomeIcons.facebook, color: Colors.blue),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage(title: "LaZone")),
              );
            }),
        IconButton(
            icon: const Icon(
              FontAwesomeIcons.google,
              color: Colors.redAccent,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage(title: "LaZone")),
              );
            }),
      ],
    );
  }
}

signin(email, password, context) async {
  var url = Uri.parse("http://localhost:8080/auth/signIn");
  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 201) {
    Map<String, dynamic> data = json.decode(response.body);
    connectedUser = data["data"]["user"];
    Navigator.pushNamed(
      context,
      '/home'
    );
  } else {
    throw Exception('Failed to login.');
  }
}
