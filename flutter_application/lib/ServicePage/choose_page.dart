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
import 'package:http/http.dart' as http;
import 'dart:convert';

chooseActionPage(context) async {

  if (areatmp.actionServiceChoose == "Github") {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChooseActionsGithub()),
    );
  }
  if (areatmp.actionServiceChoose == "Trello") {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChooseActionsTrello()),
    );
  }
  if (areatmp.actionServiceChoose == "Microsoft Planner") {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChooseActionsPlanner()),
    );
  }
}

chooseReactionPage(page, context) async {

  if (areatmp.reactionServiceChoose == "Twitter") {
    areatmp.action = page;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChooseReactionsTwitter()),
    );
  }
  if (areatmp.reactionServiceChoose == "Discord") {
    areatmp.action = page;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChooseReactionsDiscord()),
    );
  }
  if (areatmp.reactionServiceChoose == "Microsoft Teams") {
    areatmp.action = page;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChooseReactionTeams()),
    );
  }
}

chooseReactionServicePage(page, context) async {
  if (page == "Github") {
    areatmp.actionServiceChoose = page;
    button.buttonConnectionGitHub = "Connected";
    buttoncol.colbuttonConnectionGitHub = const Color.fromARGB(255, 68, 204, 5);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ReactionServicePage()),
    );
  }
  if (page == "Trello") {
    areatmp.actionServiceChoose = page;
    button.buttonConnectionTrello = "Connected";
    buttoncol.colbuttonConnectionTrello =  const Color.fromARGB(255, 68, 204, 5);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ReactionServicePage()),
    );
  }
  if (page == "Microsoft Planner") {
    areatmp.actionServiceChoose = page;
    button.buttonConnectionPlanner = "Connected";
    buttoncol.colbuttonConnectionPlanner = const Color.fromARGB(255, 68, 204, 5);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ReactionServicePage()),
    );
  }
}

setReactionService(page, context) async {
  if (page == "Twitter") {
    areatmp.reactionServiceChoose = page;
    button.buttonConnectionTwitter= "Connected";
    buttoncol.colbuttonConnectionTwitter = const Color.fromARGB(255, 68, 204, 5);
    chooseActionPage(context);
  }
  if (page == "Discord") {
    areatmp.reactionServiceChoose =  page;
    button.buttonConnectionDiscord = "Connected";
    buttoncol.colbuttonConnectionDiscord = const Color.fromARGB(255, 68, 204, 5);
    chooseActionPage(context);
  }
  if (page == "Microsoft Teams") {
    areatmp.reactionServiceChoose = page;
    button.buttonConnectionTeams = "Connected";
    buttoncol.colbuttonConnectionTeams = const Color.fromARGB(255, 68, 204, 5);
    chooseActionPage(context);
  }
}

chooseConnection(page, context) async {
  if (page == "Confirm link" && areatmp.reaction != "") {
      area.actionServiceChoose = areatmp.actionServiceChoose;
      area.reactionServiceChoose = areatmp.reactionServiceChoose;
      area.action = areatmp.action;
      area.reaction = areatmp.reaction;
      var resJson = {
        "actionService": areatmp.actionServiceChoose,
        "reactionService": areatmp.reactionServiceChoose,
        "actionId": "1",
        "reactionId": "1",
        "userId": connectedUser["id"].toString(),
        "enabled": true.toString(),
      };
      areatmp.actionServiceChoose = "";
      areatmp.reactionServiceChoose = "";
      areatmp.action = "";
      areatmp.reaction = "";
      AreaConnection(resJson, context);
  }
  if (areatmp.actionServiceChoose != "" && areatmp.reactionServiceChoose != "" && areatmp.action != "") {
      areatmp.reaction = page;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ConfirmAreaPage()),
      );
  }
  if (areatmp.actionServiceChoose != "" && areatmp.reactionServiceChoose != "" && areatmp.action == "") {
      chooseReactionPage(page, context);
  }
  chooseReactionServicePage(page, context);
  setReactionService(page, context);
}

AreaConnection(recJson, context) async {
  var url = Uri.parse("http://localhost:8080/area/new");
  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'userId': recJson["userId"],
      'actionParam': recJson["actionService"],
      'reactionParam': recJson["reactionService"],
      'reactionsId': recJson["reactionId"],
      'actionsId': recJson["actionId"],
      'enabled': recJson["enabled"],
    }),
  );
  if (response.statusCode == 201) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage(title: "LaZone",)),
    );
  } else {
    throw Exception('Failed to create area');
  }
}