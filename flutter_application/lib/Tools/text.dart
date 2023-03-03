import 'package:flutter/material.dart';
import 'color.dart';

var connectedUser;

class ButtonConnection {
  String buttonConnectionGitHub;
  String buttonConnectionYoutube;
  String buttonConnectionFacebook;
  String buttonConnectionDiscord;
  String buttonConnectionTwitter;
  String buttonConnectionTeams;
  ButtonConnection({this.buttonConnectionGitHub = "Disconected", this.buttonConnectionYoutube = "Disconected", this.buttonConnectionFacebook = "Disconected", this.buttonConnectionDiscord = "Disconected", this.buttonConnectionTwitter = "Disconected", this.buttonConnectionTeams = "Disconected"});
}
ButtonConnection button = ButtonConnection();

class CheckConnectionText {
  String buttonConnectionGitHub;
  String buttonConnectionYoutube;
  String buttonConnectionFacebook;
  String buttonConnectionDiscord;
  String buttonConnectionTwitter;
  String buttonConnectionTeams;
  CheckConnectionText({this.buttonConnectionGitHub = "Disconected", this.buttonConnectionYoutube = "Disconected", this.buttonConnectionFacebook = "Disconected", this.buttonConnectionDiscord = "Disconected", this.buttonConnectionTwitter = "Disconected", this.buttonConnectionTeams = "Disconected"});
}
CheckConnectionText buttoncheck = CheckConnectionText();

class CheckConnection {
  bool buttonChooseGitHub;
  bool buttonChooseYoutube;
  bool buttonChooseFacebook;
  bool buttonChooseDiscord;
  bool buttonChooseTwitter;
  bool buttonChooseTeams;
  CheckConnection({this.buttonChooseGitHub = false, this.buttonChooseYoutube = false, this.buttonChooseFacebook = false, this.buttonChooseDiscord = false, this.buttonChooseTwitter = false, this.buttonChooseTeams = false});
}
CheckConnection buttonChoose = CheckConnection();

const TextStyle headlineTextStyle = TextStyle(
    fontSize: 44, color: textPrimary, height: 1.2, fontFamily: "OldLondon");

const TextStyle headlineSecondaryTextStyle = TextStyle(
    fontSize: 28, color: Colors.black, height: 1.2, fontFamily: "OldLondon", decoration: TextDecoration.underline);

const TextStyle lineSecondaryTextStyle = TextStyle(
    fontSize: 28, color: Colors.black, height: 1.2, fontFamily: "OldLondon");

const TextStyle headlineSecondaryTextStyle2 = TextStyle(
    fontSize: 28, color: Colors.white, height: 1.2, fontFamily: "OldLondon");

const TextStyle bodyTextStyle = TextStyle(
    fontSize: 16, color: textPrimary, height: 1.5, fontFamily: "OldLondon");

TextStyle bodyLinkTextStyle = bodyTextStyle.copyWith(color: primary);

const TextStyle buttonTextStyle = TextStyle(
    fontSize: 18, color: Colors.white, height: 1, fontFamily: "OldLondon");
