import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../Tools/create_cards.dart';

class ChooseActionsYoutube extends StatelessWidget {
  const ChooseActionsYoutube({super.key});
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
                child: ServiceCards(
                  title: "Like a video",
                  imagePath: "assets/images/Youtube-Symbole.png",
                  textbutton :  "Choose this action",
                  colorButton :  Color.fromARGB(255, 219, 38, 38),
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                rowFit: FlexFit.tight,
                child: ServiceCards(
                  title: "Creation of a playlist",
                  imagePath: "assets/images/Youtube-Symbole.png",
                  textbutton :  "Choose this action",
                  colorButton :  Color.fromARGB(255, 219, 38, 38),
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                rowFit: FlexFit.tight,
                child: ServiceCards(
                  title: "Activity",
                  imagePath: "assets/images/Youtube-Symbole.png",
                  textbutton :  "Choose this action",
                  colorButton :  Color.fromARGB(255, 219, 38, 38),
                ),
              ),],
          ),
          ),
    );
  }
}