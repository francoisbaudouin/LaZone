import 'package:flutter/material.dart';
import 'tools/sign_up_tools.dart';

class SignUpApp extends StatelessWidget {
  const SignUpApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container (
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
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
                      Text("Create your count",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight:FontWeight.bold
                        ),),
                      SizedBox(height: 30,),
                      FirstNameInputField(),
                      SizedBox(height: 12,),
                      NameInputField(),
                      SizedBox(height: 12,),
                      EmailInputField(),
                      SizedBox(height: 12,),
                      PasswordInputField(),
                      LoginAlready(),
                      ButtonConnection(),
                    ]  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}