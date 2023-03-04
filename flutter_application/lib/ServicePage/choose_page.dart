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
import 'choose_reaction_youtube.dart';
import 'confirm_area_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Tools/setup_page.dart';
import '../Tools/global.dart';

void chooseReactionService(String page, BuildContext context) {
  if ((page == "Twitter" && buttonChoose.buttonChooseTwitter) ||
      (page == "Discord" && buttonChoose.buttonChooseDiscord) ||
      (page == "Reddit" && buttonChoose.buttonChooseReddit) ||
      (page == "Youtube" && buttonChoose.buttonChooseYoutube)) {
    area.reactionServiceChoose = page;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          switch (page) {
            case "Twitter":
              return SetPageContentService(
                message: "Choose your reaction:",
                services: ChooseReactionsTwitter(),
                sidebarWidth: 0,
              );
            case "Discord":
              return SetPageContentService(
                message: "Choose your reaction:",
                services: ChooseReactionsDiscord(),
                sidebarWidth: 0,
              );
            case "Reddit":
              return SetPageContentService(
                message: "Choose your reaction:",
                services: ChooseReactionReddit(),
                sidebarWidth: 0,
              );
            case "Youtube":
              return SetPageContentService(
                message: "Choose your reaction:",
                services: ChooseReactionYoutube(),
                sidebarWidth: 0,
              );
            default:
              throw 'Invalid page: $page';
          }
        },
      ),
    );
  }
}

void chooseActionService(String page, BuildContext context) {
  if ((page == "Github" && buttonChoose.buttonChooseGitHub) ||
      (page == "Youtube" && buttonChoose.buttonChooseYoutube) ||
      (page == "Facebook" && buttonChoose.buttonChooseFacebook) ||
      (page == "Reddit" && buttonChoose.buttonChooseReddit)) {
    area.actionServiceChoose = page;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          switch (page) {
            case "Github":
              return SetPageContentService(
                message: "Choose your action:",
                services: ChooseActionsGithub(),
                sidebarWidth: 0,
              );
            case "Youtube":
              return SetPageContentService(
                message: "Choose your action:",
                services: ChooseActionsYoutube(),
                sidebarWidth: 0,
              );
            case "Facebook":
              return SetPageContentService(
                message: "Choose your action:",
                services: ChooseActionsFacebook(),
                sidebarWidth: 0,
              );
            case "Reddit":
              return SetPageContentService(
                message: "Choose your action:",
                services: ChooseActionReddit(),
                sidebarWidth: 0,
              );
            default:
              throw 'Invalid page: $page';
          }
        },
      ),
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
              services: ReactionServicePage(),
              sidebarWidth: 0)),
    );
  }
}

chooseConnection(page, context) async {
  if (area.actionServiceChoose == "") {
    chooseActionService(page, context);
  } else if (area.action == "") {
    setAction(page, context);
  } else if (area.reactionServiceChoose == "") {
    chooseReactionService(page, context);
  } else if (page == "Confirm link" && area.reaction != "") {
    setupSendActionReaction(page, context);
  } else {
    area.reaction = page;
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const SetPageContentService(
                message: "",
                services: ConfirmAreaPage(),
                sidebarWidth: 0,
              )),
    );
  }
}

getActionId(String action) {
  var actionIds = {
    "Create a issue": 1,
    "Create a repository": 2,
    "Create a pull request": 3,
    "Creation of a post": 4,
    "Create of an album": 5,
    "Like a video": 6,
    "Creation of a playlist": 7,
    "Activity": 8,
    "New post in a subreddit": 9
  };
  id.actionId = actionIds[action]!;
}

getReactionId(String action, String service) {
  var reactionIds = {
    "Post a message-Discord": 1,
    "Create a category": 2,
    "Post a message-Room-Discord": 3,
    "Post a message-Reddit": 4,
    "Tweet": 5,
    "Suprise": 6,
  };
  id.reactionId = reactionIds["$action-$service"]!;
}

setupSendActionReaction(page, context) {
  area.actionServiceChoose = area.actionServiceChoose;
  area.reactionServiceChoose = area.reactionServiceChoose;
  area.action = area.action;
  area.reaction = area.reaction;
  getActionId(area.action);
  getReactionId(area.reaction, area.reactionServiceChoose);

  var resJson = {
    "actionParam": 'UgoBoulestreau/POC-nodejs',
    "reactionParam": '1081306551148609689',
    "actionId": id.actionId,
    "reactionId": id.reactionId,
    "userId": connectedUser["id"],
    "enabled": true,
  };
  area.actionServiceChoose = "";
  area.reactionServiceChoose = "";
  area.action = "";
  area.reaction = "";

  print(resJson);
  AreaConnection(resJson, context);
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
