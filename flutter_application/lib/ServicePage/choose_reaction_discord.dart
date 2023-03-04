import 'package:flutter/material.dart';
import 'package:flutter_application/Tools/global.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../Tools/create_cards.dart';

class ChooseReactionsDiscord extends StatelessWidget {
  const ChooseReactionsDiscord({super.key});
  @override
  Widget build(BuildContext context) {
    return Container (
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
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
                child: CreateCardsTwoChoice(
                  title: "Post a message",
                  imagePath: "assets/images/logo-discord.png",
                  textbutton :  "Choose this action",
                  colorButton : Colors.indigoAccent.shade100,
                  choiceOne: "Choose a server:",
                  choiceTwo: "Choose a channel:",
                  SecondChoiceList: DiscordChannelList,
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                rowFit: FlexFit.tight,
                child: CreateCardsOneChoice(
                  title: "Create a category",
                  imagePath: "assets/images/logo-discord.png",
                  textbutton :  "Choose this action",
                  colorButton : Colors.indigoAccent.shade100,
                  choice : "Choose a server:",
                  choiceList: DiscordServerList,
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                rowFit: FlexFit.tight,
                child: CreateCardsOneChoice(
                  title: "Create a room",
                  imagePath: "assets/images/logo-discord.png",
                  textbutton :  "Choose this action",
                  colorButton : Colors.indigoAccent.shade100,
                  choice: "Choose a server:",
                  choiceList: DiscordServerList,
                ),
              ),
            ],
          ),
          ),
      );
  }
}