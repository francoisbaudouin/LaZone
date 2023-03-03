import 'package:flutter/material.dart';
import 'title_cards.dart';
import 'global.dart';

const EdgeInsets blockMargin = EdgeInsets.fromLTRB(0, 100, 0, 0);

class SetPageContent extends StatelessWidget {
  const SetPageContent({Key? key,
                      required this.title,
                      required this.message,
                      required this.services,
                      }) : super(key:key);
  final String title;
  final String message;
  final services;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1920,
      width: 1080,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/font.jpg"), 
            fit: BoxFit.cover),
      ),
      child: Scaffold (
        backgroundColor: Colors.transparent,
        body: SizedBox(
          child: SingleChildScrollView(
            child: Column(
                  children: <Widget> [
                    const SizedBox(height: 20,),
                    WelcomCards(title: title),
                    const SizedBox(height: 70,),
                    TitleCards(message: message,),
                    services,
                  ],
            ),
          )
        ),
      ),
    );
  }
}

class SetPageContentService extends StatelessWidget {
  const SetPageContentService({Key? key,
                      required this.message,
                      required this.services}) : super(key:key);
  final String message;
  final services;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1920,
      width: 1080,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/font.jpg"), 
            fit: BoxFit.cover),
      ),
      child: Scaffold (
        appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: const Color.fromARGB(255, 18, 21, 41),
        elevation: 0.0,
        title: const Center(child: Text('Choose Action', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: "OldLondon"))),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              checkAreaValues(message);
              Navigator.pop(context);
            }
        ),
        ),
        backgroundColor: Colors.transparent,
        body: SizedBox(
          child: SingleChildScrollView(
            child: Column(
                  children: <Widget> [         
                      TitleCards(message: message,),
                      const SizedBox(height: 30,),
                      services,
                  ],
            ),
          ),
        ),
      ),
    );
  }
}

checkAreaValues(message) {
  if (message == "Choose your action:") {
    area.actionServiceChoose = "";
    area.action = "";
  }
  else if (message == "Choose your reaction service:") {
    area.reactionServiceChoose = "";
    area.action = "";
  }
  else if (message == "Choose your reaction:") {
    area.reactionServiceChoose = "";
    area.reaction = "";
  }
  else if (message == "") {
    area.reaction = "";
  }
}