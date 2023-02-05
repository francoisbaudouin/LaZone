import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../home_page.dart';
import '../Tools/color.dart';
import '../Tools/text.dart';

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
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: border)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  padding: EdgeInsets.only(bottom: 16),
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

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Container(
      margin: blockMargin,
      child: SingleChildScrollView(
      child: ResponsiveRowColumn(
        layout: ResponsiveWrapper.of(context).isSmallerThan("DESKTOP")
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        rowCrossAxisAlignment: CrossAxisAlignment.center,
        rowSpacing: 25,
        columnSpacing: 25,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: ProfileCards(
              type : "Firstname :",
              message: firstname,
              icon : const Icon(Icons.person, color: Colors.black),
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: ProfileCards(
              type : "Lastname :",
              message: lastname,
              icon : const Icon(Icons.person, color: Colors.black),
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: ProfileCards(
              type : "Pseudo :",
              message: pseudo,
              icon : const Icon(Icons.person, color: Colors.black),
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: ProfileCards(
              type : "Email :",
              message: email,
              icon : const Icon(Icons.mail, color: Colors.black),
            ),
          ),
        ],
      ),
    ),
 );
  }
}