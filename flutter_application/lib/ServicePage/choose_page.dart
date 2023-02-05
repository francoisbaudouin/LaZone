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

chooseActionPage(context) async {

  if (actionservicechoose == "Github") {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChooseActionsGithub()),
    );
  }
  if (actionservicechoose == "Trello") {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChooseActionsTrello()),
    );
  }
  if (actionservicechoose == "Microsoft Planner") {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChooseActionsPlanner()),
    );
  }
}

chooseReactionPage(page, context) async {

  if (reactionservicechoose == "Twitter") {
    action = page;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChooseReactionsTwitter()),
    );
  }
  if (reactionservicechoose == "Discord") {
    action = page;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChooseReactionsDiscord()),
    );
  }
  if (reactionservicechoose == "Microsoft Teams") {
    action = page;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChooseReactionTeams()),
    );
  }
}

chooseReactionServicePage(page, context) async {
  if (page == "Github") {
    actionservicechoose = page;
    buttonConnectionGitHub = "Connected";
    colbuttonConnectionGithub = const Color.fromARGB(255, 68, 204, 5);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ReactionServicePage()),
    );
  }
  if (page == "Trello") {
    actionservicechoose = page;
    buttonConnectionTrello = "Connected";
    colbuttonConnectionTrello =  const Color.fromARGB(255, 68, 204, 5);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ReactionServicePage()),
    );
  }
  if (page == "Microsoft Planner") {
    actionservicechoose = page;
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
    reactionservicechoose = page;
    buttonConnectionTwitter= "Connected";
    colbuttonConnectionTwitter = const Color.fromARGB(255, 68, 204, 5);
    chooseActionPage(context);
  }
  if (page == "Discord") {
    reactionservicechoose =  page;
    buttonConnectionDiscord = "Connected";
    colbuttonConnectionDiscord = const Color.fromARGB(255, 68, 204, 5);
    chooseActionPage(context);
  }
  if (page == "Microsoft Teams") {
    reactionservicechoose = page;
    buttonConnectionTeams = "Connected";
    colbuttonConnectionTeams = const Color.fromARGB(255, 68, 204, 5);
    chooseActionPage(context);
  }
}

chooseConnection(page, context) async {
  if (actionservicechoose != "" && reactionservicechoose != "" && action != "") {
      reaction = page;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage(title: "LaZone",)),
      );
  }
  if (actionservicechoose != "" && reactionservicechoose != "" && action == "") {
      chooseReactionPage(page, context);
  }
  chooseReactionServicePage(page, context);
  setReactionService(page, context);
}