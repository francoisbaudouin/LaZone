import 'package:flutter/material.dart';
import 'package:flutter_application/Tools/global.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../Tools/create_cards.dart';

class ChooseActionReddit extends StatelessWidget {
  const ChooseActionReddit({super.key});
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
                rowFit: FlexFit.loose,
                child: CreateCardsOneChoice(
                  title: "New post in a subreddit",
                  imagePath: "assets/images/Reddit-Logo.png",
                  textbutton :  "Choose this action",
                  colorButton : Color.fromARGB(255, 214, 86, 11),
                  choice :"Choose a subreddit:",
                  choiceList: globalActionsReactionsParameters['Reddit'],
                ),
              ),
            ],
          ),
          ),
    );
  }
}