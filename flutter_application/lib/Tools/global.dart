import 'dart:convert';

String globalFirstname = "";
String globalLastname = "";
String globalPseudo = "";
String globalEmail = "";
String globalPassword = "";
String serverAddress = "localhost:8080";

List<Map<String, dynamic>> areas = List<Map<String, dynamic>>.from(
  jsonDecode('''[]'''),
);

Map<String, dynamic> globalActionsReactionsParameters = {
  "Github": {},
  "Reddit": {},
  "Discord": {}
};

String GithubRepositoryList = '''
    [
      {
        "name": "Repository A"
      }
    ]
  ''';

String DiscordServerList = '''
    [
      {
        "name": "Server A"
      }
    ]
  ''';
String DiscordChannelList = '''
    [
      {
        "name": "Channel A"
      }
    ]
  ''';

String SubRedditList = '''
    [
      {
        "name": "Subreddit A"
      }
    ]
  ''';

class ActionsReactionsID {
  int actionId;
  int reactionId;
  ActionsReactionsID({this.actionId = 0, this.reactionId = 0});
}

ActionsReactionsID id = ActionsReactionsID();

const String fontFamilies = "Google Sans";

class Area {
  String actionServiceChoose;
  String reactionServiceChoose;
  String action;
  String reaction;
  String actionParam;
  String reactionParam;
  Area({this.actionServiceChoose = "", 
      this.reactionServiceChoose = "", 
      this.action = "", this.reaction = "", 
      this.actionParam = "",
      this.reactionParam = ""});
}

Area area = Area();
