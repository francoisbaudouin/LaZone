import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../Tools/create_cards.dart';

class ChooseReactionYoutube extends StatelessWidget {
  const ChooseReactionYoutube({super.key});
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
                rowFit: FlexFit.loose,
                child: ServiceCards(
                  title: "Suprise",
                  imagePath: "assets/images/Youtube-Symbole.png",
                  textbutton :  "Choose this action",
                  colorButton :  Color.fromARGB(255, 219, 38, 38),
                ),
              ),
             ],
          ),
          ),
    );
  }
}