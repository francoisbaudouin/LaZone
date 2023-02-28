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
      padding: const EdgeInsets.all(8.0),
      //decoration: const BoxDecoration(
      //    image: DecorationImage(
      //        image: AssetImage("assets/images/parchemin2.png"),
      //        fit: BoxFit.fill,
      //    ),
      //),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: icon,
                    onPressed: () {
                    },
                  alignment: Alignment.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(type, style: headlineSecondaryTextStyle),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(message, style: headlineSecondaryTextStyle),
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
      padding: const EdgeInsets.only(left: 150.0),
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
              message: user.firstname,
              icon : const Icon(Icons.person, color: Colors.black),
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: ProfileCards(
              type : "Lastname :",
              message: user.lastname,
              icon : const Icon(Icons.person, color: Colors.black),
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: ProfileCards(
              type : "Pseudo :",
              message: user.pseudo,
              icon : const Icon(Icons.person, color: Colors.black),
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: ProfileCards(
              type : "Email :",
              message: user.email,
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
    return Container(
      height: 1920,
      width: 1080,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/font-overlay.png"), 
            fit: BoxFit.cover),
      ),
      child: Scaffold (
        backgroundColor: Colors.transparent,
        body: SizedBox(
          child: SingleChildScrollView(
            child: Column(
                  children: const <Widget> [
                    SizedBox(height: 20,),
                    WelcomCards(title: "Your profile"),
                    SizedBox(height: 60,),
                    ProfilePageContent(),                  ],
            ),
          )
        ),
      ),
    );
  }
}