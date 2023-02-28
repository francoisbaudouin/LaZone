import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../Tools/create_cards.dart';

class ChooseActionsGithub extends StatelessWidget {
  const ChooseActionsGithub({super.key});
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
                child: CreateCardsOneChoice(
                  title: "Create a issue",
                  imagePath: "assets/images/github-logo.png",
                  textbutton :  "Choose this action",
                  colorButton : Colors.black,
                  choice : "Choose a repository:"
                ),
              ),
              const ResponsiveRowColumnItem(
                rowFlex: 1,
                rowFit: FlexFit.tight,
                child: ServiceCards(
                  title: "Create a repository",
                  imagePath: "assets/images/github-logo.png",
                  textbutton :  "Choose this action",
                  colorButton : Colors.black,
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                rowFit: FlexFit.tight,
                child: CreateCardsOneChoice(
                  title: "Create a pull request",
                  imagePath: "assets/images/github-logo.png",
                  textbutton :  "Choose this action",
                  colorButton : Colors.black,
                  choice : "Choose a repository:"
                ),
              ),],
          ),
          ),
    );
  }
}