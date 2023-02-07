import 'package:flutter/material.dart';
import 'package:flutter_application/ServicePage/choose_reaction_discord.dart';
import 'package:flutter_application/ServicePage/choose_reaction_twitter.dart';
import 'package:flutter_application/home_page.dart';
import 'reaction_service_page.dart';
import '../Tools/color.dart';
import '../Tools/text.dart';
import 'choose_action_github.dart';
import 'choose_action_planner.dart';
import 'choose_action_trello.dart';
import 'choose_reaction_teams.dart';
import 'confirm_area_page.dart';

chooseActionPage(context) async {

  if (actionServiceChoose == "Github") {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChooseActionsGithub()),
    );
  }
  if (actionServiceChoose == "Trello") {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChooseActionsTrello()),
    );
  }
  if (actionServiceChoose == "Microsoft Planner") {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChooseActionsPlanner()),
    );
  }
}

chooseReactionPage(page, context) async {

  if (reactionServiceChoose == "Twitter") {
    action = page;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChooseReactionsTwitter()),
    );
  }
  if (reactionServiceChoose == "Discord") {
    action = page;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChooseReactionsDiscord()),
    );
  }
  if (reactionServiceChoose == "Microsoft Teams") {
    action = page;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChooseReactionTeams()),
    );
  }
}

chooseReactionServicePage(page, context) async {
  if (page == "Github") {
    actionServiceChoose = page;
    buttonConnectionGitHub = "Connected";
    colbuttonConnectionGithub = const Color.fromARGB(255, 68, 204, 5);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ReactionServicePage()),
    );
  }
  if (page == "Trello") {
    actionServiceChoose = page;
    buttonConnectionTrello = "Connected";
    colbuttonConnectionTrello =  const Color.fromARGB(255, 68, 204, 5);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ReactionServicePage()),
    );
  }
  if (page == "Microsoft Planner") {
    actionServiceChoose = page;
    buttonConnectionPlanner = "Connected";
    colbuttonConnectionPlanner = const Color.fromARGB(255, 68, 204, 5);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ReactionServicePage()),
    );
  }
}

setReactionService(page, context) async {
  if (page == "Twitter") {
    reactionServiceChoose = page;
    buttonConnectionTwitter= "Connected";
    colbuttonConnectionTwitter = const Color.fromARGB(255, 68, 204, 5);
    chooseActionPage(context);
  }
  if (page == "Discord") {
    reactionServiceChoose =  page;
    buttonConnectionDiscord = "Connected";
    colbuttonConnectionDiscord = const Color.fromARGB(255, 68, 204, 5);
    chooseActionPage(context);
  }
  if (page == "Microsoft Teams") {
    reactionServiceChoose = page;
    buttonConnectionTeams = "Connected";
    colbuttonConnectionTeams = const Color.fromARGB(255, 68, 204, 5);
    chooseActionPage(context);
  }
}

chooseConnection(page, context) async {
  //print(page);
  if (page == "yes" && reaction != "") {
      print("a");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage(title: "LaZone",)),
      );
  }
  if (actionServiceChoose != "" && reactionServiceChoose != "" && action != "") {
      reaction = page;
      //var resJson = {
      //  "actionService": actionServiceChoose,
      //  "reactionService": reactionServiceChoose,
      //  "actionId": 1,
      //  "reactionId": 1,
      //  "userId": connectedUser["id"],
      //  "enabled": true,
      //};
      //print(resJson);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ConfirmAreaPage()),
      );
  }
  if (actionServiceChoose != "" && reactionServiceChoose != "" && action == "") {
      chooseReactionPage(page, context);
  }
  chooseReactionServicePage(page, context);
  setReactionService(page, context);
}