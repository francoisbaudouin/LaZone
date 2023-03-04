import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../home_page.dart';
import '../Tools/create_cards.dart';

class ChooseReactionsTwitter extends StatelessWidget {
  const ChooseReactionsTwitter({super.key});
  @override
  Widget build(BuildContext context) {
    return Container (
          padding: const EdgeInsets.all(5.0),
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
            children: const [
              ResponsiveRowColumnItem(
                rowFlex: 1,
                rowFit: FlexFit.loose,
                child: ServiceCards(
                  title: "Tweet",
                  imagePath: "assets/images/twitter-logo.png",
                  textbutton :  "Choose this action",
                  colorButton : Colors.lightBlue,
                ),
              ),
            ],
          ),
          ),
          ),
    );
  }
}