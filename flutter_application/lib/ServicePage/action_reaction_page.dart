import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../home_page.dart';
import '../Tools/text.dart';
import '../Tools/title_cards.dart';
import '../Tools/global.dart';

String chooseImageServiceAction(actionServiceChoose) {
  String res = "assets/images/nothing.png";

  if (actionServiceChoose == "Github") {
    res = "assets/images/github-logo.png";
  }
  if (actionServiceChoose == "Youtube") {
    res = "assets/images/Youtube-Symbole.jpg";
  }
  if (actionServiceChoose == "Facebook") {
    res = "assets/images/Facebook-logo.jpg";
  }
  return (res);

}

String chooseImageServiceReaction(reactionServiceChoose) {
  String res = "assets/images/nothing.png";

  if (reactionServiceChoose == "Twitter") {
    res = "assets/images/logo-twitter.png";
  }
  if (reactionServiceChoose == "Discord") {
    res = "assets/images/discord-logo.png";
  }
  if (reactionServiceChoose == "Reddit") {
    res = "assets/images/Reddit-Logo.jpg";
  }
  return (res);
}

class ActionReactionCards extends StatelessWidget {
  final Map<String, dynamic> area;
  final VoidCallback onDelete;
  const ActionReactionCards({Key? key, required this.area, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/parchemin.png"), 
            fit: BoxFit.fill),),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 150,),
          const Padding(
                  padding: EdgeInsets.only(bottom: 25),
                  child: Text("ACTION", style: headlineSecondaryTextStyle, textAlign: TextAlign.center),
          ),
          Padding(
                 padding: const EdgeInsets.only(bottom: 16),
                 child: Text('${area["actionServiceChoose"]}: \n${area["action"]}', style: lineSecondaryTextStyle, textAlign: TextAlign.center),
               ),
          Container(
                  constraints: const BoxConstraints(maxHeight: 175),
                  child: Image.asset(chooseImageServiceAction(area["actionServiceChoose"]), fit: BoxFit.cover),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(bottom: 25),
            child: Text("REACTION", style: headlineSecondaryTextStyle, textAlign: TextAlign.center),
          ),
          Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text('${area["reactionServiceChoose"]}: \n${area["reaction"]}', style: lineSecondaryTextStyle, textAlign: TextAlign.center),
                ),
          Container(
            constraints: const BoxConstraints(maxHeight: 175),
            child: Image.asset(chooseImageServiceReaction(area["reactionServiceChoose"]), fit: BoxFit.cover),
          ),
          const SizedBox(height: 20),
          FloatingActionButton.extended(
              onPressed: () {
                onDelete();
              },  
              backgroundColor: Color.fromARGB(255, 139, 28, 21),
              label: const Text("Delete"),
              icon: const Icon(Icons.delete),
              heroTag: null,
          ),
          const SizedBox(height: 170),
        ],
      ),
    );
  }
}

bool isDisplayDesktop(BuildContext context) {
  return ResponsiveWrapper.of(context).isDesktop;
}
class CreateactionReactionCards extends StatefulWidget {
  CreateactionReactionCards({Key? key}) : super(key: key);
  @override
  _CreateactionReactionCardsState createState() => _CreateactionReactionCardsState();
}

class _CreateactionReactionCardsState extends State<CreateactionReactionCards> {

  void deleteArea(int index) {
    setState(() {
      areas.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
  return Container(
      padding: const EdgeInsets.all(15.0),
      margin: blockMargin,
      child: SingleChildScrollView(
      child: ResponsiveRowColumn(
        layout: ResponsiveWrapper.of(context).isSmallerThan("DESKTOP")
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        rowCrossAxisAlignment: CrossAxisAlignment.center,
        columnCrossAxisAlignment: CrossAxisAlignment.center,
        rowSpacing: 25,
        columnSpacing: 25,
        children: [
          for (var i = 0; i < areas.length; i += 1)
              ResponsiveRowColumnItem(
              rowFlex: 1,
              rowFit: FlexFit.loose,
              child: ActionReactionCards(
                area: areas[i],
                onDelete: () {
                  deleteArea(i);
                },
              ),
            ),
        ],
        ),
      ),
  );
  }
}

class CreateactionReactionPage extends StatelessWidget {
  const CreateactionReactionPage({Key? key}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1920,
      width: 1080,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/font.jpg"), 
            fit: BoxFit.cover),
      ),
      child: Scaffold (
        backgroundColor: Colors.transparent,
        body: SizedBox(
          child: SingleChildScrollView(
            child: Column(
                  children: <Widget> [
                    SizedBox(height: 20,),
                    WelcomCards(title: "Your actions/reactions"),
                    CreateactionReactionCards(),                  ],
            ),
          )
        ),
      ),
    );
  }
}