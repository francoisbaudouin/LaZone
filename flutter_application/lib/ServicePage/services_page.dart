import 'package:flutter/material.dart';
import '../Tools/title_cards.dart';
import 'package:http/http.dart' as http;
import '../Tools/text.dart';
import '../Tools/color.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Tools/global.dart';

connectService(serviceName) async {
  String baseUrl = "http://$serverAddress/auth/";
  final uri = Uri.parse(baseUrl + serviceName);
  final uriPost = Uri.parse(baseUrl + serviceName);

  if (await canLaunchUrl(uri)) {
    if (connectedUser['id'] != null) {
      final response = await http
          .post(uriPost, body: {'userId': connectedUser['id'].toString()});
      if (response.statusCode != 201) {
        throw 'error in server, please retry';
      }
    } else {
      throw 'no user id';
    }
    await launchUrl(uri);
  } else {
    throw 'Could not launch $baseUrl of service named $serviceName.';
  }
}

chooseConnectionServices(page) async {
  if (page == "Twitter") {
    areatmp.reactionServiceChoose = page;
    button.buttonConnectionTwitter = "Connected";
    buttoncol.colbuttonConnectionTwitter = const Color.fromARGB(255, 14, 41, 2);
  } else if (page == "Discord") {
    areatmp.reactionServiceChoose = page;
    await connectService('Discord');
    button.buttonConnectionDiscord = "Connected";
    buttoncol.colbuttonConnectionDiscord = const Color.fromARGB(255, 14, 41, 2);
  } else if (page == "Microsoft Teams") {
    areatmp.reactionServiceChoose = page;
    button.buttonConnectionTeams = "Connected";
    buttoncol.colbuttonConnectionTeams = const Color.fromARGB(255, 14, 41, 2);
  } else if (page == "Github") {
    areatmp.actionServiceChoose = page;
    await connectService('Github');
    button.buttonConnectionGitHub = "Connected";
    buttoncol.colbuttonConnectionGitHub = const Color.fromARGB(255, 14, 41, 2);
  } else if (page == "Trello") {
    areatmp.actionServiceChoose = page;
    button.buttonConnectionTrello = "Connected";
    buttoncol.colbuttonConnectionTrello = const Color.fromARGB(255, 14, 41, 2);
  } else if (page == "Microsoft Planner") {
    areatmp.actionServiceChoose = page;
    button.buttonConnectionPlanner = "Connected";
    buttoncol.colbuttonConnectionPlanner = const Color.fromARGB(255, 14, 41, 2);
  }
}

class ServicesCardsInformations extends StatelessWidget {
  const ServicesCardsInformations(
      {Key? key,
      required this.title,
      required this.imagePath,
      required this.textbutton,
      required this.colorButton})
      : super(key: key);
  final String title;
  final String imagePath;
  final String textbutton;
  final Color colorButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/parchemin2.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 85,
          ),
          Container(
            constraints: const BoxConstraints(maxHeight: 300),
            child: Image.asset(imagePath, fit: BoxFit.fill),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(title, style: headlineSecondaryTextStyle),
                ),
                const SizedBox(
                  height: 10,
                ),
                FloatingActionButton.extended(
                  onPressed: () {
                    chooseConnectionServices(title);
                  },
                  backgroundColor: colorButton,
                  label: Text(textbutton,
                      style: const TextStyle(fontFamily: "OldLondon")),
                  icon: const Icon(Icons.navigate_next),
                  heroTag: null,
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReactionServicesCards extends StatelessWidget {
  const ReactionServicesCards({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: ResponsiveRowColumn(
        layout: ResponsiveWrapper.of(context).isSmallerThan("DESKTOP")
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        rowCrossAxisAlignment: CrossAxisAlignment.start,
        rowSpacing: 10,
        columnSpacing: 10,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: ServicesCardsInformations(
              title: "Twitter",
              imagePath: "assets/images/logo-twitter.png",
              textbutton: button.buttonConnectionTwitter,
              colorButton: buttoncol.colbuttonConnectionTwitter,
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: ServicesCardsInformations(
              title: "Discord",
              imagePath: "assets/images/discord-logo.png",
              textbutton: button.buttonConnectionDiscord,
              colorButton: buttoncol.colbuttonConnectionDiscord,
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: ServicesCardsInformations(
              title: "Microsoft Teams",
              imagePath: "assets/images/Microsoft-Teams-Symbole.png",
              textbutton: button.buttonConnectionTeams,
              colorButton: buttoncol.colbuttonConnectionTeams,
            ),
          ),
        ],
      ),
    );
  }
}

class ActionsServicesCards extends StatelessWidget {
  const ActionsServicesCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: ResponsiveRowColumn(
          layout: ResponsiveWrapper.of(context).isSmallerThan("DESKTOP")
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          rowCrossAxisAlignment: CrossAxisAlignment.center,
          rowSpacing: 25,
          columnSpacing: 25,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: 1,
              rowFit: FlexFit.loose,
              child: ServicesCardsInformations(
                title: "Github",
                imagePath: "assets/images/github-logo.png",
                textbutton: button.buttonConnectionGitHub,
                colorButton: buttoncol.colbuttonConnectionGitHub,
              ),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 1,
              rowFit: FlexFit.tight,
              child: ServicesCardsInformations(
                title: "Trello",
                imagePath: "assets/images/Trello-Symbole.png",
                textbutton: button.buttonConnectionTrello,
                colorButton: buttoncol.colbuttonConnectionTrello,
              ),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 1,
              rowFit: FlexFit.tight,
              child: ServicesCardsInformations(
                title: "Microsoft Planner",
                imagePath: "assets/images/Planner-logo.png",
                textbutton: button.buttonConnectionPlanner,
                colorButton: buttoncol.colbuttonConnectionPlanner,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SetPageServices extends StatelessWidget {
  const SetPageServices({
    Key? key,
    required this.message,
  }) : super(key: key);
  final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1920,
      width: 1080,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/font.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TitleCards(
                  message: message,
                ),
                const SizedBox(
                  height: 30,
                ),
                const ActionsServicesCards(),
                const SizedBox(
                  height: 10,
                ),
                const ReactionServicesCards(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
