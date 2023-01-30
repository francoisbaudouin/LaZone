import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../home_page.dart';
import 'create_cards.dart';
import '../Tools/color.dart';
import '../Tools/text.dart';

class TrelloPage extends StatelessWidget {
  const TrelloPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: const Color.fromARGB(255, 127, 184, 250),
        elevation: 0.0,
        title: const Center(child: Text('Github', textAlign: TextAlign.center)),
      ),
      body: Center(
        child: SingleChildScrollView(
        child :Container(
        margin: blockMargin,
        child: ResponsiveRowColumn(
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
                title: "Github",
                imagePath: "../assets/images/github-logo.png",
                linkUrl:
                    "https://developers.googleblog.com/2019/12/flutter-ui-ambient-computing.html",
                text: "Disconnected",
                textbutton :  buttonConnectionGitHub,
                colorButton : colbuttonConnectionGithub,
              ),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 1,
              rowFit: FlexFit.tight,
              child: FlutterNewCard(
                title: "Choose your service to link wiht Github",
                imagePath: "../assets/images/discord-logo.png",
                linkUrl:
                    "https://developers.googleblog.com/2019/12/flutter-ui-ambient-computing.html",
                text: "Disconnected",
                textbutton :  buttonConnectionDiscord,
                colorButton : colbuttonConnectionDicord,
              ),
            ),
          ],
        ),
        ),
        ),
      ),
    );
  }
}