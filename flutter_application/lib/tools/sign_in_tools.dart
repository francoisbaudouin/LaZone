import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../sign_in_page.dart';
import '../sign_up_page.dart';
import '../home_page.dart';

class EmailInputFieldIn extends StatelessWidget {
  const EmailInputFieldIn({super.key});
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

class PasswordInputFieldIn extends StatelessWidget {
  const PasswordInputFieldIn({super.key});
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
                MaterialPageRoute(builder: (context) => const LoginApp()),
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

class CreateCount extends StatelessWidget {
  const CreateCount({super.key});

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
                MaterialPageRoute(builder: (context) => const SignUp()),
              );
            },
            child:const Text("Click here to create a new count",
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