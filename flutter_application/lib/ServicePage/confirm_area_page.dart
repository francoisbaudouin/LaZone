import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../home_page.dart';
import '../Tools/color.dart';
import '../Tools/text.dart';
import 'choose_page.dart';

class CreateConfirmCard extends StatelessWidget {
  const CreateConfirmCard(
      {Key? key,
      required this.title,
      required this.textbutton,
      required this.colorButton})
      : super(key: key);
  final String title;
  final String textbutton;
  final Color colorButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: border)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(title, style: headlineSecondaryTextStyle, textAlign: TextAlign.center),
                ),
                const SizedBox(height: 10),
                FloatingActionButton.extended(
                    onPressed: () {
                      chooseConnection("Confirm link", context);
                    },
                    backgroundColor: colorButton,
                    label: Text(textbutton),
                    icon: const Icon(Icons.navigate_next),
                    heroTag: null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ConfirmAreaPage extends StatelessWidget {
  const ConfirmAreaPage({super.key});
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
                child: CreateConfirmCard(
                  title: "Confirm your link ?",
                  textbutton :  "Confirm",
                  colorButton : Colors.black,
                ),
              ),
            ],
          ),
          ),
    );
  }
}