import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'github_page.dart';
import '../Tools/color.dart';
import '../Tools/text.dart';

//chooseConnection(page, context) async {
//  if (page == "Github") {
//    connectService(context);
//  }
//}

connectService(context) async {
  var url = Uri.parse("http://localhost:8080/auth/github");
  final http.Response response = await http.get(url);

  if (response.statusCode == 201) {
    buttonConnectionGitHub = "Connected";
    colbuttonConnectionGithub =  const Color.fromARGB(255, 68, 204, 5);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GithubPage()),
    );
  } else {
    throw Exception('Failed to connect service.');
  }
}

class FlutterNewCard extends StatelessWidget {
  FlutterNewCard(
      {Key? key,
      required this.title,
      required this.imagePath,
      required this.linkUrl,
      required this.text,
      required this.textbutton,
      required this.colorButton})
      : super(key: key);
  String title;
  String imagePath;
  String linkUrl;
  String text;
  String textbutton;
  Color colorButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: border)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            constraints: const BoxConstraints(maxHeight: 300),
            child: Image.asset(imagePath, fit: BoxFit.fill),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(title, style: headlineSecondaryTextStyle),
                ),
                GestureDetector(
                  onTap: () async {
                    connectService(context);
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: colorButton,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        textbutton,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
