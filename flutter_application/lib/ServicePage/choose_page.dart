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
import '../Tools/setup_page.dart';

chooseReactionService(page, context) async {
  if (page == "Twitter" && buttonChoose.buttonChooseTwitter == true) {
    areatmp.reactionServiceChoose = page;
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const SetPageContentService(
              message: "Choose your reaction:",
              services: ChooseReactionsTwitter())),
    );
  }
  if (page == "Discord" && buttonChoose.buttonChooseDiscord == true) {
    areatmp.reactionServiceChoose = page;
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const SetPageContentService(
              message: "Choose your reaction:",
              services: ChooseReactionsDiscord())),
    );
  }
  if (page == "Microsoft Teams" && buttonChoose.buttonChooseTeams == true) {
    areatmp.reactionServiceChoose = page;
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const SetPageContentService(
              message: "Choose your arection:",
              services: ChooseReactionTeams())),
    );
  }
}

chooseActionService(page, context) async {
  if (page == "Github" && buttonChoose.buttonChooseGitHub == true) {
    areatmp.actionServiceChoose = page;
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const SetPageContentService(
              message: "Choose your action:", services: ChooseActionsGithub())),
    );
  } else if (page == "Trello" && buttonChoose.buttonChooseTrello == true) {
    areatmp.actionServiceChoose = page;
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const SetPageContentService(
              message: "Choose your action:", services: ChooseActionsTrello())),
    );
  } else if (page == "Microsoft Planner" && buttonChoose.buttonChoosePlanner) {
    areatmp.actionServiceChoose = page;
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const SetPageContentService(
              message: "Choose your action:",
              services: ChooseActionsPlanner())),
    );
  }
}

setAction(page, context) async {
  if (areatmp.actionServiceChoose != "" && areatmp.action == "") {
    areatmp.action = page;
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const SetPageContentService(
              message: "Choose your reaction service:",
              services: ReactionServicePage())),
    );
  }
}

setupSendActionReaction(page, context) {
  area.actionServiceChoose = areatmp.actionServiceChoose;
  area.reactionServiceChoose = areatmp.reactionServiceChoose;
  area.action = areatmp.action;
  area.reaction = areatmp.reaction;
  var resJson = {
    "actionParam": "UgoBoulestreau/POC-nodejs",
    "reactionParam": "1062389081973215262",
    "actionId": 1,
    "reactionId": 1,
    "userId": connectedUser["id"],
    "enabled": true,
  };
  areatmp.actionServiceChoose = "";
  areatmp.reactionServiceChoose = "";
  areatmp.action = "";
  areatmp.reaction = "";
  AreaConnection(resJson, context);
}

chooseConnection(page, context) async {
  if (areatmp.actionServiceChoose == "") {
    chooseActionService(page, context);
  } else if (areatmp.actionServiceChoose != "" && areatmp.action == "") {
    setAction(page, context);
  } else if (areatmp.actionServiceChoose != "" &&
      areatmp.action != "" &&
      areatmp.reactionServiceChoose == "") {
    chooseReactionService(page, context);
  } else if (page == "Confirm link" && areatmp.reaction != "") {
    setupSendActionReaction(page, context);
  } else {
    areatmp.reaction = page;
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const SetPageContentService(
              message: "", services: ConfirmAreaPage())),
    );
  }
}

AreaConnection(recJson, context) async {
  var url = Uri.parse("http://localhost:8080/areas/new");
  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'userId': recJson["userId"],
      'actionParam': recJson["actionParam"],
      'reactionParam': recJson["reactionParam"],
      'reactionsId': recJson["reactionId"],
      'actionsId': recJson["actionId"],
      'enabled': recJson["enabled"],
    }),
  );
  if (response.statusCode == 201) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const MyHomePage(
                title: "LaZone",
              )),
    );
  } else {
    throw Exception('Failed to create area');
  }
}
