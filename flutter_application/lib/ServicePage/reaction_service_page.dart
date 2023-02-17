import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../Tools/create_cards.dart';
import '../Tools/color.dart';
import '../Tools/text.dart';

class ReactionServicePage extends StatelessWidget {
  const ReactionServicePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.all(15.0),            
          child :ResponsiveRowColumn(
          layout: ResponsiveWrapper.of(context).isSmallerThan("DESKTOP")
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          rowCrossAxisAlignment: CrossAxisAlignment.start,
          rowSpacing: 10,
          columnSpacing: 10,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: 1,
              rowFit: FlexFit.tight,
              child: FlutterNewCard(
                title: "Twitter",
                imagePath: "assets/images/logo-twitter.png",
                textbutton :  button.buttonConnectionTwitter,
                colorButton : buttoncol.colbuttonConnectionTwitter,
              ),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 1,
              rowFit: FlexFit.tight,
              child: FlutterNewCard(
                title: "Discord",
                imagePath: "assets/images/discord-logo.png",
                textbutton :  button.buttonConnectionDiscord,
                colorButton : buttoncol.colbuttonConnectionDiscord,
              ),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 1,
              rowFit: FlexFit.tight,
              child: FlutterNewCard(
                title: "Microsoft Teams",
                imagePath: "assets/images/Microsoft-Teams-Symbole.png",
                textbutton :  button.buttonConnectionTeams,
                colorButton : buttoncol.colbuttonConnectionTeams,
              ),
            ),
            ],
          ),
    );
  }
}