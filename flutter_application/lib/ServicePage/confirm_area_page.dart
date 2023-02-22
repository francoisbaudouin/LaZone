import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
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
      decoration: const BoxDecoration(
        image: DecorationImage(
              image: AssetImage("assets/images/parchemin.png"),
              fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(100, 40, 100, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(title, style: headlineSecondaryTextStyle, textAlign: TextAlign.center),
                ),
                const SizedBox(height: 20),
                FloatingActionButton.extended(
                    onPressed: () {
                      chooseConnection("Confirm link", context);
                    },
                    backgroundColor: colorButton,
                    label: Text(textbutton),
                    icon: const Icon(Icons.navigate_next),
                    heroTag: null,
                ),
                const SizedBox(height: 50),
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
          padding: const EdgeInsets.only(),
          //child: SingleChildScrollView(
          child: ResponsiveRowColumn(
            layout: ResponsiveWrapper.of(context).isSmallerThan("DESKTOP")
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            rowMainAxisAlignment: MainAxisAlignment.center,
            rowCrossAxisAlignment: CrossAxisAlignment.center,
            rowSpacing: 10,
            columnSpacing: 10,
            children: const [
              ResponsiveRowColumnItem(
                rowFlex: 1,
                rowFit: FlexFit.loose,
                child: CreateConfirmCard(
                  title: "Confirm your link ?",
                  textbutton :  "Confirm",
                  colorButton : Colors.black,
                ),
              ),
            ],
          ),
          //),
    );
  }
}