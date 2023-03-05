import 'package:flutter/material.dart';
import 'package:flutter_application/Tools/text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:email_validator/email_validator.dart';
import 'sign_in_page.dart';
import 'sign_up_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../home_page.dart';
import '../Tools/global.dart';
import 'package:url_launcher/url_launcher.dart';

connectWithMicrosoft(context) async {
  String baseUrl = "http://$serverAddress/auth/Microsoft";
  final uri = Uri.parse(baseUrl);
  var getUrl = Uri.parse("http://$serverAddress/auth/Microsoft/success");

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication)
        .then((value) async {
      final http.Response response = await http.get(
        getUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 201) {
        Map<String, dynamic> data = json.decode(response.body);
        connectedUser = data["data"]["user"];
        Navigator.pushNamed(context, '/home');
      } else {
        throw Exception('Failed to login.');
      }
    });
  } else {
    throw 'Could not launch Microsoft auth.';
  }
}

class ForgottenPassword extends StatelessWidget {
  const ForgottenPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      },
      child: const Text(
        "Forgotten Password",
        style: TextStyle(
            color: Color.fromARGB(255, 74, 8, 136),
            fontFamily: "OldLondon",
            fontSize: 20),
      ),
    );
  }
}

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignUpPage()),
        );
      },
      child: const Text(
        "Click here to create a new account",
        style: TextStyle(
            color: Color.fromARGB(255, 74, 8, 136),
            fontFamily: "OldLondon",
            fontSize: 20),
      ),
    );
  }
}

class ButtonConnection extends StatelessWidget {
  ButtonConnection({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        bool isValid = EmailValidator.validate(globalEmail);
        if (isValid) {
          signin(globalEmail, globalPassword, context);
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
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "OldLondon"),
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
    return FloatingActionButton.extended(
      icon: const Icon(FontAwesomeIcons.microsoft, color: Colors.blue),
      onPressed: () async {
        connectWithMicrosoft(context);
      },
      backgroundColor: Colors.transparent,
      label: const Text("Login with Microsoft",
          style: TextStyle(fontFamily: "OldLondon")),
    );
  }
}

signin(email, password, context) async {
  var url = Uri.parse("http://$serverAddress/auth/signIn");
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
    Navigator.pushNamed(context, '/home');
  } else {
    throw Exception('Failed to login.');
  }
}
