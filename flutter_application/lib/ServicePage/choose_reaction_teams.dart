import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../Tools/create_cards.dart';

class ChooseReactionTeams extends StatelessWidget {
  const ChooseReactionTeams({super.key});
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
              const ResponsiveRowColumnItem(
                rowFlex: 1,
                rowFit: FlexFit.tight,
                child: ServiceCards(
                  title: "Create a team",
                  imagePath: "assets/images/Microsoft-Teams-Symbole.png",
                  textbutton :  "Choose this action",
                  colorButton : Colors.indigo,
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                rowFit: FlexFit.tight,
                child: ServiceCards(
                  title: "Create a room",
                  imagePath: "assets/images/Microsoft-Teams-Symbole.png",
                  textbutton :  "Choose this action",
                  colorButton : Colors.indigo,
                ),
              ),
            ],
          ),
          ),
    );
  }
}