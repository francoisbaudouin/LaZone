import 'package:flutter/material.dart';
import 'tools/sign_in_tools.dart';
import 'tools/sign_up_tools.dart';

class SingInApp extends StatelessWidget{
  const SingInApp({super.key});
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
                  children: const <Widget> [
                    SizedBox(height: 30,),
                    Text("Hello",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight:FontWeight.bold
                      ),),
                    SizedBox(height: 10,),
                    Text("Sign in with your account",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),),
                    SizedBox(height: 30,),
                    EmailInputFieldIn(),
                    SizedBox(height: 12,),
                    PasswordInputFieldIn(),
                    ForgottenPassword(),
                    ButtonConnection(),
                    SizedBox(height: 17 ,),
                    CreateCount(),
                    SizedBox(height: 15,),
                    ButtonService(),
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