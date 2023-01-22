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
                    EmailInputFieldIn(),
                    const SizedBox(height: 12,),
                    PasswordInputFieldIn(),
                    const ForgottenPassword(),
                    const ButtonConnection(),
                    const SizedBox(height: 17 ,),
                    const CreateAccount(),
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
