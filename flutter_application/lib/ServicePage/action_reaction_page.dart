import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../home_page.dart';
import '../Tools/color.dart';
import '../Tools/text.dart';


String chooseImageServiceAction() {
  String res = "";

  if (area.actionServiceChoose == "Github") {
    res = "assets/images/github-logo.png";
  }
  if (area.actionServiceChoose == "Trello") {
    res = "assets/images/Trello-Symbole.jpg";
  }
  if (area.actionServiceChoose == "Planner") {
    res = "assets/images/Planner-logo.jpg";
  }
  return (res);

}

String chooseImageServiceReaction() {
  String res = "";

  if (area.reactionServiceChoose == "Twitter") {
    res = "assets/images/logo-twitter.png";
  }
  if (area.reactionServiceChoose == "Discord") {
    res = "assets/images/discord-logo.png";
  }
  if (area.reactionServiceChoose == "Microsoft Teams") {
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
                  child: Text('${area.actionServiceChoose}: \n${area.action}', style: headlineSecondaryTextStyle, textAlign: TextAlign.center),
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
                  child: Text('${area.reactionServiceChoose}: \n${area.reaction}', style: headlineSecondaryTextStyle, textAlign: TextAlign.center),
                ),
                FloatingActionButton.extended(
                    onPressed: () {
                      area.actionServiceChoose = "";
                      area.action = "";
                      area.reactionServiceChoose = "";
                      area.reaction = "";
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