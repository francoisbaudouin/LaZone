import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'tools/sign_in_tools.dart';

class SingInApp extends StatelessWidget{
  SingInApp({super.key});
  var _email = "";
  var _password = "";
  var button = ButtonConnection(email: "", password: "");
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
              const SizedBox(height: 200,),
              Container(
                width: 325,
                height: 470,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget> [
                    const SizedBox(height: 30,),
                    const Text("Hello",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight:FontWeight.bold
                      ),),
                    const SizedBox(height: 10,),
                    const Text("Sign in with your account",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),),
                    const SizedBox(height: 30,),
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
                    const ForgottenPassword(),
                    const SizedBox(height: 15 ,),
                    button,
                    const SizedBox(height: 15,),
                    const ButtonService(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
