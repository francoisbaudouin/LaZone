import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../home_page.dart';
import '../Tools/create_cards.dart';
import '../Tools/text.dart';

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
            children: const [
              ResponsiveRowColumnItem(
                rowFlex: 1,
                rowFit: FlexFit.tight,
                child: FlutterNewCard(
                  title: "Create a issue",
                  imagePath: "assets/images/github-logo.png",
                  textbutton :  "Choose this action",
                  colorButton : Colors.black,
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                rowFit: FlexFit.tight,
                child: FlutterNewCard(
                  title: "Create a project",
                  imagePath: "assets/images/github-logo.png",
                  textbutton :  "Choose this action",
                  colorButton : Colors.black,
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                rowFit: FlexFit.tight,
                child: FlutterNewCard(
                  title: "Create a pull request",
                  imagePath: "assets/images/github-logo.png",
                  textbutton :  "Choose this action",
                  colorButton : Colors.black,
                ),
              ),],
          ),
          ),
    );
  }
}