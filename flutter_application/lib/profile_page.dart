import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'Tools/text.dart';
import 'Tools/title_cards.dart';

class ProfileCards extends StatelessWidget {
  const ProfileCards(
      {Key? key,
      required this.type,
      required this.message,
      required this.icon})
      : super(key: key);
  
  final String type;
  final String message;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/parchemin2.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(100, 0, 100, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 40,
                ),
                IconButton(
                  icon: icon,
                    onPressed: () {
                    },
                  alignment: Alignment.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Text(type, style: headlineSecondaryTextStyle),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(message, style: lineSecondaryTextStyle),
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePageContent extends StatelessWidget {
  const ProfilePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Container(
      padding: const EdgeInsets.only(left: 0.0),
      child: SingleChildScrollView(
      child: ResponsiveRowColumn(
        layout: ResponsiveWrapper.of(context).isSmallerThan("DESKTOP")
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        rowCrossAxisAlignment: CrossAxisAlignment.center,
        rowSpacing: 15,
        columnSpacing: 0,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.loose,
            child: ProfileCards(
              type : "Firstname :",
              message: connectedUser["firstname"],
              icon : const Icon(Icons.person, color: Colors.black),
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: ProfileCards(
              type : "Lastname :",
              message: connectedUser["lastname"],
              icon : const Icon(Icons.person, color: Colors.black),
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: ProfileCards(
              type : "Pseudo :",
              message: connectedUser["pseudo"],
              icon : const Icon(Icons.person, color: Colors.black),
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: ProfileCards(
              type : "Email :",
              message: connectedUser["email"],
              icon : const Icon(Icons.mail, color: Colors.black),
            ),
          ),
        ],
      ),
    ),
 );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    var sidebarWidth = 60.0;
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
                    SizedBox(height: 20,),
                    WelcomCards(title: "Your profile"),
                    SizedBox(height: 60,),
                    Padding(
                    padding: EdgeInsets.only(left: sidebarWidth),
                    child:
                      ProfilePageContent(),                  
                    ),
                  ]
                ,
            ),
          )
        ),
      ),
    );
  }
}