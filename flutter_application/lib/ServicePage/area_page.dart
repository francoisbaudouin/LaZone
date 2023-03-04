import 'package:flutter/material.dart';
import 'package:flutter_application/Tools/text.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../Tools/create_cards.dart';
import '../Tools/color.dart';

class AreaPageServicesCards extends StatelessWidget {
  const AreaPageServicesCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: SingleChildScrollView(
        child: ResponsiveRowColumn(
          layout: ResponsiveWrapper.of(context).isSmallerThan("DESKTOP")
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          rowCrossAxisAlignment: CrossAxisAlignment.center,
          rowSpacing: 0,
          columnSpacing: 25,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: 1,
              rowFit: FlexFit.tight,
              child: ServiceCards(
                title: "Github",
                imagePath: "assets/images/github-logo.png",
                textbutton: buttoncheck.buttonConnectionGitHub,
                colorButton: buttonchoosecol.colbuttonChooseGitHub,
              ),
            ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: ServiceCards(
              title: "Youtube",
              imagePath: "assets/images/Youtube-Symbole.png",
              textbutton :  buttoncheck.buttonConnectionYoutube,
              colorButton : buttonchoosecol.colbuttonChooseYoutube,
            ),
          ),
            ResponsiveRowColumnItem(
              rowFlex: 1,
              rowFit: FlexFit.tight,
              child: ServiceCards(
                title: "Facebook",
                imagePath: "assets/images/Facebook-logo.png",
                textbutton: buttoncheck.buttonConnectionFacebook,
                colorButton: buttonchoosecol.colbuttonChooseFacebook,
              ),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 1,
              rowFit: FlexFit.tight,
              child: ServiceCards(
                title: "Reddit",
                imagePath: "assets/images/Reddit-Logo.png",
                textbutton: buttoncheck.buttonConnectionReddit,
                colorButton: buttonchoosecol.colbuttonChooseReddit,
              ),
            ),
          ],
        ),
      ),
    );
  }
}