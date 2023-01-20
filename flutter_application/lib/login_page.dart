import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginApp extends StatelessWidget{
  void click(){}
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
                  children: [
                    const SizedBox(height: 30,),
                    const Text("Bonjour",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight:FontWeight.bold
                      ),),
                    const SizedBox(height: 10,),
                    const Text("Connectez-vous avec votre compte",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),),
                    const SizedBox(height: 30,),
                    Container(
                      width: 260,
                      height: 60,
                      child: const TextField(
                        decoration: InputDecoration(
                            suffix: Icon(FontAwesomeIcons.envelope,color: Colors.red,),
                            labelText: "Adresse e-mail",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            )
                        ),
                      ),
                    ),
                    const SizedBox(height: 12,),
                    Container(
                      width: 260,
                      height: 60,
                      child: const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            suffix: Icon(FontAwesomeIcons.eyeSlash,color: Colors.red,),
                            labelText: "Mots de passe",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            )
                        ),
                      ),
                    ),
                    Padding(
                      padding:const EdgeInsets.fromLTRB(20, 0, 30, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: click,
                            child:const Text("Mots de passe oublié",
                              style: TextStyle(
                                  color: Colors.deepOrange
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
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
                          child: Text('Connexion',
                            style: TextStyle(color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 17 ,),
                    const Text("Ou connectez-vous avec votre réseaux sociale",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: click,
                            icon: const Icon(FontAwesomeIcons.facebook,color: Colors.blue)
                        ),
                        IconButton(
                            onPressed: click,
                            icon: const Icon(FontAwesomeIcons.google,color: Colors.redAccent,)
                        ),
                      ],
                    )
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