import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../home_page.dart';
import '../sign_in_page.dart';

class FirstNameInputField extends StatelessWidget {
  const FirstNameInputField({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container( 
        width: 260,
        height: 60,
        child: const TextField(
          decoration: InputDecoration(
              suffix: Icon(FontAwesomeIcons.user,color: Colors.red,),
              labelText: "First Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              )
          ),
        ),
      ),
    );
  }
}

class NameInputField extends StatelessWidget {
  const NameInputField({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 60,
      child: const TextField(
        decoration: InputDecoration(
            suffix: Icon(FontAwesomeIcons.user,color: Colors.red,),
            labelText: "Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            )
        ),
      ),
    );
  }
}

class EmailInputField extends StatelessWidget {
  const EmailInputField({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 60,
      child: const TextField(
        decoration: InputDecoration(
            suffix: Icon(FontAwesomeIcons.envelope,color: Colors.red,),
            labelText: "Email address",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            )
        ),
      ),
    );
  }
}

class PasswordInputField extends StatelessWidget {
  const PasswordInputField({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 60,
      child: const TextField(
        obscureText: true,
        decoration: InputDecoration(
            suffix: Icon(FontAwesomeIcons.eyeSlash,color: Colors.red,),
            labelText: "Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            )
        ),
      ),
    );
  }
}

class ButtonConnection extends StatelessWidget {
  const ButtonConnection({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyHomePage(title: "LaZone")),
          );
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
                ])
        ),
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text('Connection',
            style: TextStyle(color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold),
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
                MaterialPageRoute(builder: (context) => const LoginApp()),
                );
              },
            child: const Text("Already sign in ?",
              style: TextStyle(
                color: Colors.deepOrange
              ),
            ),
          )
        ],
      ),
    );
  }
}
