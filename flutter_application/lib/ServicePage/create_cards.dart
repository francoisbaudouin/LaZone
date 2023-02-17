import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Tools/color.dart';
import '../Tools/text.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'dart:convert' show jsonDecode;

//chooseConnection(page, context) async {
//  if (page == "Github") {
//    connectService(context);
//  }
//}

connectService(context) async {
  final githubClientId = '5e06f93aa7ceec6b9e8c';
  final callbackUrlScheme = 'http://localhost:8081/#/home';
  final currentUrl = Uri.base;

  // Construct the url
  final url = Uri.https('github.com', '/login/oauth/authorize', {
    'response_type': 'code',
    'client_id': githubClientId,
    //'redirect_uri': callbackUrlScheme,
    'scope': 'email',
  });

  // Present the dialog to the user
  // final result = await FlutterWebAuth2.authenticate(
  //     url: url.toString(), callbackUrlScheme: callbackUrlScheme);
  print('auth');
  final result = await FlutterWebAuth2.authenticate(
    url: url.toString(),
    callbackUrlScheme: 'foobar',
  );
  // Extract code from resulting url
  final code = Uri.parse(result).queryParameters['code'];
  print('code');
  print(code);

  // Construct an Uri to Google's oauth2 endpoint
  final url2 = Uri.https('github.com', '/login/oauth/access_token');

  // Use this code to get an access token
  final response = await http.post(url2, body: {
    'client_id': githubClientId,
    //'redirect_uri': 'http://localhost:8081/#/home',
    'grant_type': 'authorization_code',
    'code': code,
  });
  print('response');
  print(response);

  // Get the access token from the response
  final accessToken = jsonDecode(response.body)['access_token'] as String;
  print("accessToken");
  print(accessToken);
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
                    print("Bonjour");

                    final test = await connectService(context);
                    print(test);
                    print("Bonjour mais apres");
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
