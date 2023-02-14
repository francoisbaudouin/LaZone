import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../home_page.dart';
import 'create_cards.dart';
import '../Tools/color.dart';
import '../Tools/text.dart';

class ReactionServicePage extends StatelessWidget {
  const ReactionServicePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: const Color.fromARGB(255, 127, 184, 250),
        elevation: 0.0,
        title: const Center(child: Text('Choose reaction service', textAlign: TextAlign.center)),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              areatmp.action = "";
              areatmp.reactionServiceChoose = "";
              Navigator.pop(context);
            }
        ),
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
                  title: "Twitter",
                  imagePath: "assets/images/logo-twitter.jpg",
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
                  imagePath: "assets/images/Microsoft-Teams-Symbole.jpg",
                  textbutton :  button.buttonConnectionTeams,
                  colorButton : buttoncol.colbuttonConnectionTeams,
                ),
              ),],
          ),
          ),
          ),
        ),
    );
  }
}