import 'package:flutter/material.dart';
import 'package:flutter_application/Tools/text.dart';

class TitleCards extends StatelessWidget {
  const TitleCards(
      {Key? key,
      required this.message})
      : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding :  const EdgeInsets.fromLTRB(0, 40, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Text(message, style: headlineSecondaryTextStyle2, textAlign: TextAlign.start, textScaleFactor:1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WelcomCards extends StatelessWidget {
  const WelcomCards(
      {Key? key,
      required this.title,})
      : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(title, style: headlineSecondaryTextStyle2, textAlign: TextAlign.center, textScaleFactor:2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}