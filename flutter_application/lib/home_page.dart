import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'ServicePage/area_page.dart';
import 'ServicePage/action_reaction_page.dart';
import 'profile_page.dart';
import 'Tools/setup_page.dart';
import 'ServicePage/services_page.dart';
import 'Tools/global.dart';

const EdgeInsets blockMargin = EdgeInsets.fromLTRB(0, 100, 0, 0);

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

  /// Callback function
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
      child: CreateactionReactionPage(),
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
    //appBar: AppBar(
    //  toolbarHeight: 40.0,
    //  backgroundColor: const Color.fromARGB(255, 18, 21, 41),
    //  elevation: 0.0,
    //  title: const Center(
    //    child: Text('LaZone',
    //      textAlign: TextAlign.center,
    //      style: TextStyle(color: Colors.white, fontFamily: "OldLondon")
    //    ),
    //  ),
    //  leading: IconButton(
    //    color: Colors.white,
    //    icon: const Icon(Icons.settings_ethernet),
    //    onPressed: () async {
    //      var url = Uri.parse("http://$serverAddress/about.json");
    //      launchUrl(url);
    //    },
    //    tooltip: "about.json"
    //  ),
    //  actions: <Widget>[
    //    IconButton(
    //      alignment: Alignment.topLeft,
    //      color: Colors.white,
    //      icon: const Icon(Icons.download),
    //      onPressed: () async {
    //        var url = Uri.parse("http://localhost:8081/client.apk");
    //        launchUrl(url);
    //      },
    //      tooltip: "client.apk"
    //    ),
    //    IconButton(
    //      color: Colors.white,
    //      icon: const Icon(Icons.logout),
    //      onPressed: () {
    //        globalFirstname = "";
    //        globalLastname = "";
    //        globalPseudo = "";
    //        globalEmail = "";
    //        globalPassword = "";
    //        areas.clear();
    //        Navigator.pushNamed(context, '/');
    //      },
    //    ),
    //  ]
    //),
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
          tooltip: "about.json"
        ),
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
        globalFirstname = "";
        globalLastname = "";
        globalPseudo = "";
        globalEmail = "";
        globalPassword = "";
        areas.clear();
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
                shrinkIconColor: Colors.white
              ),
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
                  fontFamily: "OldLondon"
                )
              ),
            ),
            selectedIndex: _selectedIndex,
            initiallyExpanded: false,
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
            onTap: (index) {
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
