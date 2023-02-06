import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../home_page.dart';
import 'create_cards.dart';
import '../Tools/text.dart';

class ChooseReactionsDiscord extends StatelessWidget {
  const ChooseReactionsDiscord({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: const Color.fromARGB(255, 127, 184, 250),
        elevation: 0.0,
        title: const Center(child: Text('Choose Reaction', textAlign: TextAlign.center)),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              action = "";
              reaction = "";
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
                  title: "Post a message",
                  imagePath: "assets/images/discord-logo.png",
                  textbutton :  "Choose this action",
                  colorButton : Colors.indigoAccent.shade100,
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                rowFit: FlexFit.tight,
                child: FlutterNewCard(
                  title: "Create a category",
                  imagePath: "assets/images/discord-logo.png",
                  textbutton :  "Choose this action",
                  colorButton : Colors.indigoAccent.shade100,
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                rowFit: FlexFit.tight,
                child: FlutterNewCard(
                  title: "Create a room",
                  imagePath: "assets/images/discord-logo.png",
                  textbutton :  "Choose this action",
                  colorButton : Colors.indigoAccent.shade100,
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                rowFit: FlexFit.tight,
                child: FlutterNewCard(
                  title: "Create a discussion fill",
                  imagePath: "assets/images/discord-logo.png",
                  textbutton :  "Choose this action",
                  colorButton : Colors.indigoAccent.shade100,
                ),
              ),],
          ),
          ),
          ),
        ),
    );
  }
}