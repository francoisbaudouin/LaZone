import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../Tools/create_cards.dart';

class ChooseActionsTrello extends StatelessWidget {
  const ChooseActionsTrello({super.key});
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
                  title: "Create a cards",
                  imagePath: "assets/images/Trello-Symbole.png",
                  textbutton :  "Choose this action",
                  colorButton : Colors.blue,
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                rowFit: FlexFit.tight,
                child: FlutterNewCard(
                  title: "Create a table",
                  imagePath: "assets/images/Trello-Symbole.png",
                  textbutton :  "Choose this action",
                  colorButton : Colors.blue,
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                rowFit: FlexFit.tight,
                child: FlutterNewCard(
                  title: "Create an organization",
                  imagePath: "assets/images/Trello-Symbole.png",
                  textbutton :  "Choose this action",
                  colorButton : Colors.blue,
                ),
              ),],
          ),
          ),
    );
  }
}