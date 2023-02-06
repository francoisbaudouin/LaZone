import 'package:flutter/material.dart';
import '../Tools/color.dart';
import '../Tools/text.dart';
import 'choose_page.dart';
class FlutterNewCard extends StatelessWidget {
  const FlutterNewCard(
      {Key? key,
      required this.title,
      required this.imagePath,
      required this.textbutton,
      required this.colorButton})
      : super(key: key);
  final String title;
  final String imagePath;
  final String textbutton;
  final Color colorButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: border)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            constraints: const BoxConstraints(maxHeight: 300),
            child: Image.asset(imagePath, fit: BoxFit.fill),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(title, style: headlineSecondaryTextStyle),
                ),
                FloatingActionButton.extended(
                    onPressed: () {
                      chooseConnection(title, context);
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