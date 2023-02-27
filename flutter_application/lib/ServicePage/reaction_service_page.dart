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
              child: ServiceCards(
                title: "Twitter",
                imagePath: "assets/images/logo-twitter.png",
                textbutton :  buttoncheck.buttonConnectionTwitter,
                colorButton : buttonchoosecol.colbuttonChooseTwitter,
              ),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 1,
              rowFit: FlexFit.tight,
              child: ServiceCards(
                title: "Discord",
                imagePath: "assets/images/discord-logo.png",
                textbutton :  buttoncheck.buttonConnectionDiscord,
                colorButton : buttonchoosecol.colbuttonChooseDiscord,
              ),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 1,
              rowFit: FlexFit.tight,
              child: ServiceCards(
                title: "Microsoft Teams",
                imagePath: "assets/images/Microsoft-Teams-Symbole.png",
                textbutton :  buttoncheck.buttonConnectionTeams,
                colorButton : buttonchoosecol.colbuttonChooseTeams,
              ),
            ),
            ],
          ),
    );
  }
}