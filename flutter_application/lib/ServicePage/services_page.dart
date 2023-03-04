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
  final response;

  if (await canLaunchUrl(uri)) {
    if (connectedUser['id'] != null) {
      response = await http
          .post(uriPost, body: {'userId': connectedUser['id'].toString()});
      if (response.statusCode != 201) {
        throw 'error in server, please retry';
      }
    } else {
      throw 'no user id';
    }
    print(response.body);
    launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $baseUrl of service named $serviceName.';
  }
}

refreshPage(context) {
  Navigator.pushNamed(context, '/home');
}

chooseConnectionServices(page, context) async {
  if (page == "Twitter" && buttonChoose.buttonChooseTwitter == false) {
    buttonChoose.buttonChooseTwitter = true;
    button.buttonConnectionTwitter = "Connected";
    buttoncheck.buttonConnectionTwitter = "Choose";
    buttonchoosecol.colbuttonChooseTwitter = colorConnected;
    buttoncol.colbuttonConnectionTwitter = const Color.fromARGB(255, 14, 41, 2);
  } else if (page == "Discord" && buttonChoose.buttonChooseDiscord == false) {
    await connectService('Discord');
    buttonChoose.buttonChooseDiscord = true;
    button.buttonConnectionDiscord = "Connected";
    buttoncheck.buttonConnectionDiscord = "Choose";
    buttonchoosecol.colbuttonChooseDiscord = colorConnected;
    buttoncol.colbuttonConnectionDiscord = const Color.fromARGB(255, 14, 41, 2);
  } else if (page == "Reddit" && buttonChoose.buttonChooseReddit == false) {
    buttonChoose.buttonChooseReddit = true;
    button.buttonConnectionReddit = "Connected";
    buttoncheck.buttonConnectionReddit = "Choose";
    buttonchoosecol.colbuttonChooseReddit = colorConnected;
    buttoncol.colbuttonConnectionReddit = const Color.fromARGB(255, 14, 41, 2);
  } else if (page == "Github" && buttonChoose.buttonChooseGitHub == false) {
    await connectService('Github');
    buttonChoose.buttonChooseGitHub = true;
    button.buttonConnectionGitHub = "Connected";
    buttoncheck.buttonConnectionGitHub = "Choose";
    buttonchoosecol.colbuttonChooseGitHub = colorConnected;
    buttoncol.colbuttonConnectionGitHub = const Color.fromARGB(255, 14, 41, 2);
  } else if (page == "Youtube" && buttonChoose.buttonChooseYoutube == false) {
    buttonChoose.buttonChooseYoutube = true;
    button.buttonConnectionYoutube = "Connected";
    buttoncheck.buttonConnectionYoutube = "Choose";
    buttonchoosecol.colbuttonChooseYoutube = colorConnected;
    buttoncol.colbuttonConnectionYoutube = const Color.fromARGB(255, 14, 41, 2);
  } else if (page == "Facebook" && buttonChoose.buttonChooseFacebook == false) {
    buttonChoose.buttonChooseFacebook = true;
    button.buttonConnectionFacebook = "Connected";
    buttoncheck.buttonConnectionFacebook = "Choose";
    buttonchoosecol.colbuttonChooseFacebook = colorConnected;
    buttoncol.colbuttonConnectionFacebook =
        const Color.fromARGB(255, 14, 41, 2);
  }
  refreshPage(context);
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
            padding: const EdgeInsets.fromLTRB(100, 0, 100, 40),
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
                    chooseConnectionServices(title, context);
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
      padding: const EdgeInsets.all(0.0),
      child: ResponsiveRowColumn(
        layout: ResponsiveWrapper.of(context).isSmallerThan("DESKTOP")
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        rowCrossAxisAlignment: CrossAxisAlignment.start,
        rowSpacing: 0,
        columnSpacing: 25,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: ServicesCardsInformations(
              title: "Twitter",
              imagePath: "assets/images/twitter-logo.png",
              textbutton: button.buttonConnectionTwitter,
              colorButton: buttoncol.colbuttonConnectionTwitter,
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: ServicesCardsInformations(
              title: "Discord",
              imagePath: "assets/images/logo-discord.png",
              textbutton: button.buttonConnectionDiscord,
              colorButton: buttoncol.colbuttonConnectionDiscord,
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: ServicesCardsInformations(
              title: "Reddit",
              imagePath: "assets/images/Reddit-Logo.png",
              textbutton: button.buttonConnectionReddit,
              colorButton: buttoncol.colbuttonConnectionReddit,
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
      padding: const EdgeInsets.all(0.0),
      child: SingleChildScrollView(
        child: ResponsiveRowColumn(
          layout: ResponsiveWrapper.of(context).isSmallerThan("DESKTOP")
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          rowCrossAxisAlignment: CrossAxisAlignment.center,
          rowSpacing: 0,
          columnSpacing: 25,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: 1,
              rowFit: FlexFit.tight,
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
                title: "Youtube",
                imagePath: "assets/images/Youtube-Symbole.png",
                textbutton: button.buttonConnectionYoutube,
                colorButton: buttoncol.colbuttonConnectionYoutube,
              ),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 1,
              rowFit: FlexFit.tight,
              child: ServicesCardsInformations(
                title: "Facebook",
                imagePath: "assets/images/Facebook-logo.png",
                textbutton: button.buttonConnectionFacebook,
                colorButton: buttoncol.colbuttonConnectionFacebook,
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
    required this.title,
    required this.message,
  }) : super(key: key);
  final String title;
  final String message;
  @override
  Widget build(BuildContext context) {
    var sidebarWidth = 60.0;
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
                const SizedBox(
                  height: 20,
                ),
                WelcomCards(title: title),
                const SizedBox(height: 70,),
                Padding(
                  padding: EdgeInsets.only(left: sidebarWidth),
                  child: TitleCards(
                      message: message,
                    ),
                ),
                const SizedBox(height: 30,),
                Padding(
                  padding: EdgeInsets.only(left: sidebarWidth),
                  child: const ActionsServicesCards(),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.only(left: sidebarWidth),
                  child: const ReactionServicesCards(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
