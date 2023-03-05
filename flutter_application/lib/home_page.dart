import 'package:flutter/material.dart';
import 'package:flutter_application/Tools/text.dart';
import 'package:side_navigation/side_navigation.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'ServicePage/area_page.dart';
import 'ServicePage/action_reaction_page.dart';
import 'profile_page.dart';
import 'Tools/setup_page.dart';
import 'ServicePage/services_page.dart';
import 'Tools/global.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Tools/color.dart';

const EdgeInsets blockMargin = EdgeInsets.fromLTRB(0, 0, 0, 0);

const List<Condition> blockWidthConstraints = [
  Condition.equals(name: MOBILE, value: BoxConstraints(maxWidth: 600)),
  Condition.equals(name: TABLET, value: BoxConstraints(maxWidth: 700)),
  Condition.largerThan(name: TABLET, value: BoxConstraints(maxWidth: 1280)),
];

class BlockWrapper extends StatelessWidget {
  final Widget widget;

  const BlockWrapper(this.widget, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ResponsiveConstraints(
          constraintsWhen: blockWidthConstraints, child: widget),
    );
  }
}

class HomeView extends StatefulWidget {
  final int currentIndex;

  final Function(int selectedIndex) onTapped;
  const HomeView(this.currentIndex, this.onTapped);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  List<Widget> views = [
    const SizedBox(
      child: SetPageServices(
        title: "Welcome,",
        message: "Connect to services :",
      ),
    ),
    const SizedBox(
      child: SetPageContent(
        title: "",
        message: "Choose a service :",
        services: AreaPageServicesCards(),
      ),
    ),
    SizedBox(
      child: CreateActionReactionPage(),
    ),
    const SizedBox(
      child: ProfilePage(),
    ),
    const Center(
      child: Text('Settings'),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40.0,
        backgroundColor: const Color.fromARGB(255, 18, 21, 41),
        elevation: 0.0,
        title: const Center(
          child: Text(
            'LaZone',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontFamily: "OldLondon"),
          ),
        ),
        leading: Row(
          children: [
            Expanded(
              child: IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.settings_ethernet),
                  onPressed: () async {
                    var url = Uri.parse("http://$serverAddress/about.json");
                    launchUrl(url);
                  },
                  tooltip: "about.json"),
            ),
            Expanded(
              child: IconButton(
                color: Colors.white,
                icon: const Icon(Icons.download),
                onPressed: () async {
                  var url = Uri.parse("http://localhost:8081/client.apk");
                  launchUrl(url);
                },
                tooltip: "client.apk",
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.logout),
            onPressed: () {
              reset();
              Navigator.pushNamed(context, '/');
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: views.elementAt(_selectedIndex),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            child: SideNavigationBar(
              theme: SideNavigationBarTheme(
                backgroundColor: const Color.fromARGB(255, 18, 21, 41),
                togglerTheme: const SideNavigationBarTogglerTheme(
                    expandIconColor: Colors.white,
                    shrinkIconColor: Colors.white),
                itemTheme: SideNavigationBarItemTheme(
                  unselectedItemColor: Colors.white,
                  selectedItemColor: const Color.fromARGB(255, 165, 216, 255),
                  iconSize: 32.5,
                  labelTextStyle: const TextStyle(
                    fontFamily: "OldLondon",
                  ),
                ),
                dividerTheme: SideNavigationBarDividerTheme.standard(),
              ),
              footer: const SideNavigationBarFooter(
                label: Text('Reduce',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontFamily: "OldLondon")),
              ),
              initiallyExpanded: false,
              selectedIndex: _selectedIndex,
              items: const [
                SideNavigationBarItem(
                  icon: Icons.home,
                  label: 'Services',
                ),
                SideNavigationBarItem(
                  icon: Icons.integration_instructions,
                  label: 'Create Area',
                ),
                SideNavigationBarItem(
                  icon: Icons.account_tree_sharp,
                  label: 'Actions/Reactions',
                ),
                SideNavigationBarItem(
                  icon: Icons.person,
                  label: 'Account',
                ),
              ],
              onTap: (index) async {
                if (index == 2) {
                  areas.clear();
                  await getUsersAreas();
                }
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

reset() {
  globalFirstname = "";
  globalLastname = "";
  globalPseudo = "";
  globalEmail = "";
  globalPassword = "";
  connectedUser = {};
  button = ButtonConnection();
  buttonChoose = CheckConnection();
  buttoncheck = CheckConnectionText();
  buttoncol = ButtonConnectionColor();
  buttonchoosecol = ButtonChooseColor();
  areas.clear();
  area = Area();
}

getUsersAreas() async {
  var url = Uri.parse("http://$serverAddress/areas");
  http.Response response = await http.get(url, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  });
  List<dynamic> data = json.decode(response.body);

  if (response.statusCode == 201) {
    for (var item in data) {
      if (item["userId"] == connectedUser["id"]) {
        Map<String, dynamic> action =
            await getActionReactionData(item['actionsId'], 'actions');
        Map<String, dynamic> reaction =
            await getActionReactionData(item['reactionsId'], 'reactions');
        areas.add({
          "actionServiceChoose": action['serviceName'],
          "action": action['name'],
          "reactionServiceChoose": reaction['serviceName'],
          "reaction": reaction['name']
        });
      }
    }
  } else {
    throw Exception('Failed to retrieve all areas.');
  }
}

getActionReactionData(id, type) async {
  var url = Uri.parse("http://$serverAddress/$type/$id");
  final response = await http.get(url, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  });
  if (response.statusCode == 200) {
    Map<String, dynamic> returnValue = json.decode(response.body);

    return returnValue;
  } else {
    throw Exception('Failed to retrieve action/reaction data.');
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return HomeView(_currentIndex, (index) {
            setState(() {
              _currentIndex = index;
            });
          });
        },
      ),
    );
  }
}
