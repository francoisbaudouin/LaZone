import 'package:flutter/material.dart';
import 'package:flutter_application/ServicePage/choose_action_youtube.dart';
import 'package:flutter_application/ServicePage/choose_reaction_discord.dart';
import 'package:flutter_application/ServicePage/choose_reaction_twitter.dart';
import 'package:flutter_application/home_page.dart';
import 'reaction_service_page.dart';
import '../Tools/text.dart';
import 'choose_action_github.dart';
import 'choose_action_facebook.dart';
import 'choose_action_reddit.dart';
import 'choose_reaction_reddit.dart';
import 'confirm_area_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Tools/setup_page.dart';
import '../Tools/global.dart';

chooseReactionService(page, context) async {
  if (page == "Twitter" && buttonChoose.buttonChooseTwitter == true) {
    area.reactionServiceChoose = page;
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const SetPageContentService(
              message: "Choose your reaction:",
              services: ChooseReactionsTwitter())),
    );
  }
  if (page == "Discord" && buttonChoose.buttonChooseDiscord == true) {
    area.reactionServiceChoose = page;
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const SetPageContentService(
              message: "Choose your reaction:",
              services: ChooseReactionsDiscord())),
    );
  }
  if (page == "Reddit" && buttonChoose.buttonChooseReddit == true) {
    area.reactionServiceChoose = page;
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const SetPageContentService(
              message: "Choose your reaction:",
              services: ChooseReactionReddit())),
    );
  }
}

chooseActionService(page, context) async {
  if (page == "Github" && buttonChoose.buttonChooseGitHub == true) {
    area.actionServiceChoose = page;
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const SetPageContentService(
              message: "Choose your action:", services: ChooseActionsGithub())),
    );
  } else if (page == "Youtube" && buttonChoose.buttonChooseYoutube == true) {
    area.actionServiceChoose = page;
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const SetPageContentService(
              message: "Choose your action:", services: ChooseActionsYoutube())),
    );
  } else if (page == "Facebook" && buttonChoose.buttonChooseFacebook == true) {
    area.actionServiceChoose = page;
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const SetPageContentService(
              message: "Choose your action:",
              services: ChooseActionsFacebook())),
    );
  } else if (page == "Reddit" && buttonChoose.buttonChooseReddit == true) {
    area.actionServiceChoose = page;
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const SetPageContentService(
              message: "Choose your action:",
              services: ChooseActionReddit())),
    );
  }
}

setAction(page, context) async {
  if (area.actionServiceChoose != "" && area.action == "") {
    area.action = page;
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const SetPageContentService(
              message: "Choose your reaction service:",
              services: ReactionServicePage())),
    );
  }
}

getActionId(String action) {
  if (action == "Create a issue") {
    id.actionId = 1;
  } else if (action == "Create a repository") {
    id.actionId = 2;
  } else if (action == "Create a pull request") {
    id.actionId = 3;
  } else if (action == "Like a post") {
    id.actionId = 4;
  } else if (action == "Create a group of discussion") {
    id.actionId = 5;
  } else if (action == "Like a video") {
    id.actionId = 6;
  } else if (action == "A video was posted \nby one of my subscriptions") {
    id.actionId = 7;
  } else if (action == "One of my subscriptions \nhas posted in the community tab") {
    id.actionId = 8;
  }
}

getReactionId(String action, String service) {
  if (action == "Post a message" && service == "Discord") {
    id.reactionId = 1;
  } else if (action == "Create a category") {
    id.reactionId = 2;
  } else if (action == "Create a room" && service == "Discord") {
    id.reactionId = 3;
  } else if (action == "Post a message" && service == "Reddit") {
    id.reactionId = 4;
  } else if (action == "Create a team") {
    id.reactionId = 5;
  } else if (action == "Create a room" && service == "Reddit") {
    id.reactionId = 6;
  }
}

setupSendActionReaction(page, context) {
  getActionId(area.action);
  getReactionId(area.reaction, area.reactionServiceChoose);
  var resJson = {
    "actionParam": "UgoBoulestreau/POC-nodejs",
    "reactionParam": "1062389081973215262",
    "actionId": id.actionId,
    "reactionId": id.reactionId,
    "userId": connectedUser["id"],
    "enabled": true,
  };
  AreaConnection(resJson, context);
}

chooseConnection(page, context) async {
  if (area.actionServiceChoose == "") {
    chooseActionService(page, context);
  } else if (area.actionServiceChoose != "" && area.action == "") {
    setAction(page, context);
  } else if (area.actionServiceChoose != "" &&
      area.action != "" &&
      area.reactionServiceChoose == "") {
    chooseReactionService(page, context);
  } else if (page == "Confirm link" && area.reaction != "") {
    setupSendActionReaction(page, context);
  } else {
    area.reaction = page;
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const SetPageContentService(
              message: "", services: ConfirmAreaPage())),
    );
  }
}

AreaConnection(recJson, context) async {
  var url = Uri.parse("http://$serverAddress/areas/new");
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
    area.actionServiceChoose = "";
    area.reactionServiceChoose = "";
    area.action = "";
    area.reaction = "";
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
