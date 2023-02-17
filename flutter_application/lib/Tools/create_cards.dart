import 'package:flutter/material.dart';
import 'color.dart';
import 'text.dart';
import '../ServicePage/choose_page.dart';

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
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        image: const DecorationImage(
              image: AssetImage("assets/images/parchemin2.png"),
              fit: BoxFit.fill,
        ),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: border)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 10,),
          Container(
            constraints: const BoxConstraints(maxHeight: 300),
            child: Image.asset(imagePath, fit: BoxFit.fill),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(title, style: headlineSecondaryTextStyle),
                ),
                const SizedBox(height: 10,),
                FloatingActionButton.extended(
                    onPressed: () {
                      chooseConnection(title, context);
                    },
                    backgroundColor: colorButton,
                    label: Text(textbutton, style: TextStyle(fontFamily: "OldLondon")),
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