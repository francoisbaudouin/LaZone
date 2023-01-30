import 'package:flutter/material.dart';
import 'color.dart';

String firstname = "";

String lastname = "";

String pseudo  = "";

String email = "";

const String fontFamily = "Google Sans";

String buttonConnectionGitHub = "Disconected";

String buttonConnectionTrello = "Disconected";

String buttonConnectionPlanner = "Disconected";

String buttonConnectionDiscord = "Disconected";

String buttonConnectionTwitter = "Disconected";

String buttonConnectionTeams = "Disconected";

const TextStyle headlineTextStyle = TextStyle(
    fontSize: 44, color: textPrimary, height: 1.2, fontFamily: fontFamily);

const TextStyle headlineSecondaryTextStyle = TextStyle(
    fontSize: 28, color: textPrimary, height: 1.2, fontFamily: fontFamily);

const TextStyle bodyTextStyle = TextStyle(
    fontSize: 16, color: textPrimary, height: 1.5, fontFamily: "Roboto");

TextStyle bodyLinkTextStyle = bodyTextStyle.copyWith(color: primary);

const TextStyle buttonTextStyle = TextStyle(
    fontSize: 18, color: Colors.white, height: 1, fontFamily: fontFamily);