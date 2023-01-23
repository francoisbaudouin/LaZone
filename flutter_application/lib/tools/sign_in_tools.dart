import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../sign_in_page.dart';
import '../sign_up_page.dart';
import '../home_page.dart';


class ForgottenPassword extends StatelessWidget {
  const ForgottenPassword({super.key});

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
            child: const Text("Forgotten Password",
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

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.fromLTRB(20, 0, 30, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpApp()),
              );
            },
            child:const Text("Click here to create a new account",
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

class ButtonConnection extends StatelessWidget {
  ButtonConnection({super.key, required this.email, required this.password});
  String email;
  String password;
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


class ButtonService extends StatelessWidget {
  const ButtonService({super.key});

  @override
  Widget build(BuildContext context) {
   return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: const Icon(FontAwesomeIcons.facebook,color: Colors.blue),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage(title: "LaZone")),
              );
            }
        ),
        IconButton(
            icon: const Icon(FontAwesomeIcons.google,color: Colors.redAccent,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage(title: "LaZone")),
              );
            }
        ),
      ],
   );
  }
}