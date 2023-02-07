import 'package:flutter/material.dart';
import 'color.dart';

class User {
  String firstname;
  String lastname;
  String pseudo;
  String email;
  User({this.firstname = "", this.lastname = "", this.pseudo = "", this.email = ""});
}
User user = User();

var connectedUser;

class ButtonConnection {
  String buttonConnectionGitHub;
  String buttonConnectionTrello;
  String buttonConnectionPlanner;
  String buttonConnectionDiscord;
  String buttonConnectionTwitter;
  String buttonConnectionTeams;
  ButtonConnection({this.buttonConnectionGitHub = "Disconected", this.buttonConnectionTrello = "Disconected", this.buttonConnectionPlanner = "Disconected", this.buttonConnectionDiscord = "Disconected", this.buttonConnectionTwitter = "Disconected", this.buttonConnectionTeams = "Disconected"});
}
ButtonConnection button = ButtonConnection();
const String fontFamily = "Google Sans";

class Area {
  String actionServiceChoose;
  String reactionServiceChoose;
  String action;
  String reaction;
  Area({this.actionServiceChoose = "", this.reactionServiceChoose = "", this.action = "", this.reaction = ""});
}
Area area = Area();
Area areatmp = Area();

const TextStyle headlineTextStyle = TextStyle(
    fontSize: 44, color: textPrimary, height: 1.2, fontFamily: fontFamily);

const TextStyle headlineSecondaryTextStyle = TextStyle(
    fontSize: 28, color: textPrimary, height: 1.2, fontFamily: fontFamily);

const TextStyle bodyTextStyle = TextStyle(
    fontSize: 16, color: textPrimary, height: 1.5, fontFamily: "Roboto");

TextStyle bodyLinkTextStyle = bodyTextStyle.copyWith(color: primary);

const TextStyle buttonTextStyle = TextStyle(
    fontSize: 18, color: Colors.white, height: 1, fontFamily: fontFamily);