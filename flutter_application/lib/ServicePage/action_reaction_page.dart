import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../home_page.dart';
import '../Tools/color.dart';
import '../Tools/text.dart';

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
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(action, style: headlineSecondaryTextStyle),
                ),
                const SizedBox(height: 40),
                const Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text("REACTION : ", style: headlineSecondaryTextStyle),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(reaction, style: headlineSecondaryTextStyle),
                ),
                FloatingActionButton.extended(
                    onPressed: () {
                      
                    },
                    backgroundColor: Colors.red,
                    label: Text("Delete"),
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