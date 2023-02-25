import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Tools/color.dart';
import '../Tools/text.dart';
import 'package:url_launcher/url_launcher.dart';

connectService(context, serviceName) async {
  const baseUrl = "http://localhost:8080/auth/";
  final uri = Uri.parse(baseUrl + serviceName);
  final uriPost = Uri.parse(baseUrl + serviceName);

  if (await canLaunchUrl(uri)) {
    final response = await http
        .post(uriPost, body: {'userId': connectedUser['id'].toString()});
    if (response.statusCode != 201) {
      throw 'error in server, please retry';
    }
    await launchUrl(uri, webOnlyWindowName: "_self");
  } else {
    throw 'Could not launch $baseUrl of service named $serviceName.';
  }
}

class FlutterNewCard extends StatelessWidget {
  const FlutterNewCard(
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
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
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
                    await connectService(context, 'discord');
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
