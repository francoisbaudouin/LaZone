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


const String fontFamilies= "Google Sans";

class Area {
  String actionServiceChoose;
  String reactionServiceChoose;
  String action;
  String reaction;
  String discordserver;
  String discordchannel;
  String discordcategory;
  String githubrepository;
  String redditmessage;
  String subreddit;
  Area({this.actionServiceChoose = "", this.reactionServiceChoose = "", this.action = "", this.reaction = "", this.discordserver = "", this.discordchannel = "", this.discordcategory = "",this.githubrepository = "", this.redditmessage = "", this.subreddit = ""});
}
Area area = Area();
