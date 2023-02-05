import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../home_page.dart';
import '../Tools/color.dart';
import '../Tools/text.dart';


String chooseImageServiceAction() {
  String res = "";

  if (actionservicechoose == "Github") {
    res = "assets/images/github-logo.png";
  }
  if (actionservicechoose == "Trello") {
    res = "assets/images/Trello-Symbole.jpg";
  }
  if (actionservicechoose == "Planner") {
    res = "assets/images/Planner-logo.jpg";
  }
  return (res);

}

String chooseImageServiceReaction() {
  String res = "";

  if (reactionservicechoose == "Twitter") {
    res = "assets/images/logo-twitter.jpg";
  }
  if (reactionservicechoose == "Discord") {
    res = "assets/images/discord-logo.png";
  }
  if (reactionservicechoose == "Microsoft Teams") {
    res = "assets/images/Microsoft-Teams-Symbole.jpg";
  }
  return (res);

}


class ActionReactionCards extends StatelessWidget {
  const ActionReactionCards(
      {Key? key})
      : super(key: key);

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
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text("ACTION : ", style: headlineSecondaryTextStyle),
                ),
                Container(
                  constraints: const BoxConstraints(maxHeight: 100),
                  child: Image.asset(chooseImageServiceAction(), fit: BoxFit.cover),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text('$actionservicechoose: \n$action', style: headlineSecondaryTextStyle, textAlign: TextAlign.center),
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text("REACTION : ", style: headlineSecondaryTextStyle),
                ),
                Container(
                  constraints: const BoxConstraints(maxHeight: 100),
                  child: Image.asset(chooseImageServiceReaction(), fit: BoxFit.cover),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text('$reactionservicechoose: \n$reaction', style: headlineSecondaryTextStyle, textAlign: TextAlign.center),
                ),
                FloatingActionButton.extended(
                    onPressed: () {
                      actionservicechoose = "";
                      action = "";
                      reactionservicechoose = "";
                      reaction = "";
                    },
                    backgroundColor: Colors.red,
                    label: const Text("Delete"),
                    icon: const Icon(Icons.delete),
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

class CreateactionReactionCards extends StatelessWidget {
  const CreateactionReactionCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Container(
      margin: blockMargin,
      child: SingleChildScrollView(
      child: ResponsiveRowColumn(
        layout: ResponsiveWrapper.of(context).isSmallerThan("DESKTOP")
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        rowCrossAxisAlignment: CrossAxisAlignment.center,
        rowSpacing: 25,
        columnSpacing: 25,
        children: const [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.loose,
            child: ActionReactionCards(),
          ),
        ],
      ),
    ),
 );
  }
}