import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'sign_in_tools.dart';

class SignInApp extends StatelessWidget{
  SignInApp({super.key});
  var button = ButtonConnection(email: "", password: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
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
                          color: Colors.black,
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
                        child: SizedBox( 
                          width: 260,
                          height: 60,
                          child: TextField(
                            onChanged: (value) {
                                button.email = value;
                              },
                            decoration: const InputDecoration(
                              suffix: Icon(FontAwesomeIcons.user,color: Colors.red,),
                              labelText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                          ),
                        ),
                    ),
                    const SizedBox(height: 5,),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: SizedBox( 
                          width: 260,
                          height: 60,
                          child: TextField(
                            obscureText: true,
                            onChanged: (value) {
                                button.password = value;
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
                    const CreateAccount(),
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
