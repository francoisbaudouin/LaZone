import 'package:flutter/material.dart';


const Color primary = Color(0xFF1389FD);
const Color primaryDark = Color(0xFF0276e8);
const Color primaryLight = Color(0xFFE7F8FF);

const Color textPrimary = Color(0xFF4A4A4A);

const Color buttonPrimaryDark = Color(0xFF0075E6);
const Color buttonPrimaryDarkPressed = Color(0xFF006ED9);
const Color buttonPrimaryPressedOutline = Color(0xFF8DCDFD);

const Color background = Color(0xFFF8F9FA);
const Color backgroundDark = Color(0xFF303c42);
const Color border = Color(0x20000000);

class ButtonConnectionColor {
  Color colbuttonConnectionGitHub;
  Color colbuttonConnectionYoutube;
  Color colbuttonConnectionFacebook;
  Color colbuttonConnectionDiscord;
  Color colbuttonConnectionTwitter;
  Color colbuttonConnectionTeams;
  ButtonConnectionColor({this.colbuttonConnectionGitHub = const Color.fromARGB(255, 68, 12, 10), this.colbuttonConnectionYoutube = const Color.fromARGB(255, 68, 12, 10), this.colbuttonConnectionFacebook = const Color.fromARGB(255, 68, 12, 10), this.colbuttonConnectionDiscord = const Color.fromARGB(255, 68, 12, 10), this.colbuttonConnectionTwitter = const Color.fromARGB(255, 68, 12, 10), this.colbuttonConnectionTeams = const Color.fromARGB(255, 68, 12, 10)});
}
ButtonConnectionColor buttoncol = ButtonConnectionColor();

const colorDisconnected= const Color.fromARGB(255, 97, 97, 97);
const colorConnected = const Color.fromARGB(255, 0, 0, 0);


class ButtonChooseColor {
  Color colbuttonChooseGitHub;
  Color colbuttonChooseYoutube;
  Color colbuttonChooseFacebook;
  Color colbuttonChooseDiscord;
  Color colbuttonChooseTwitter;
  Color colbuttonChooseTeams;
  ButtonChooseColor({this.colbuttonChooseGitHub = colorDisconnected, this.colbuttonChooseYoutube = colorDisconnected, this.colbuttonChooseFacebook = colorDisconnected, this.colbuttonChooseDiscord = colorDisconnected, this.colbuttonChooseTwitter = colorDisconnected, this.colbuttonChooseTeams = colorDisconnected});
}
ButtonChooseColor buttonchoosecol = ButtonChooseColor();