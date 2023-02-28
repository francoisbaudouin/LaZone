import 'package:flutter/material.dart';
import 'package:flutter_application/Tools/text.dart';
import 'package:side_navigation/side_navigation.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'Tools/create_cards.dart';
import 'Tools/color.dart';
import 'ServicePage/action_reaction_page.dart';
import 'profile_page.dart';
import 'Tools/setup_page.dart';
import 'ServicePage/services_page.dart';

const EdgeInsets blockMargin = EdgeInsets.fromLTRB(0, 100, 0, 0);

class HomePageServicesCards extends StatelessWidget {
  const HomePageServicesCards({Key? key}) : super(key: key);

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
            child: ServiceCards(
              title: "Github",
              imagePath: "assets/images/github-logo.png",
              textbutton :  buttoncheck.buttonConnectionGitHub,
              colorButton : buttonchoosecol.colbuttonChooseGitHub,
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: ServiceCards(
              title: "Youtube",
              imagePath: "assets/images/Youtube-Symbole.png",
              textbutton :  buttoncheck.buttonConnectionYoutube,
              colorButton : buttonchoosecol.colbuttonChooseYoutube,
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: ServiceCards(
              title: "Microsoft Planner",
              imagePath: "assets/images/Planner-logo.png",
              textbutton : buttoncheck.buttonConnectionPlanner,
              colorButton : buttonchoosecol.colbuttonChoosePlanner,
            ),
          ),
        ],
      ),
      ),
    );
  }
}

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
  List<Widget> views =  [
    const SizedBox(
        child : SetPageContent(title: "Welcome,", message: "Choose a service :", services: HomePageServicesCards(),),
    ),
    const SizedBox(
      child: SetPageServices(message: "All services"),
    ),
    const SizedBox(
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
      appBar: AppBar(
        toolbarHeight: 40.0,
        backgroundColor: const Color.fromARGB(255, 18, 21, 41),
        elevation: 0.0,
        title: const Center(child: Text('LaZone', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: "OldLondon"))),
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.download),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/');
            },
          ),
        ]
      ),
      body: Row(
        children: [
          SideNavigationBar(
            theme: SideNavigationBarTheme(
              backgroundColor: const Color.fromARGB(255, 18, 21, 41),
              togglerTheme: const SideNavigationBarTogglerTheme(expandIconColor: Colors.white, shrinkIconColor: Colors.white),
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
              label: Text('Reduce', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontFamily: "OldLondon")),
            ),
            selectedIndex: _selectedIndex,
            items: const [
              SideNavigationBarItem(
                icon: Icons.integration_instructions,
                label: 'Action service',
              ),
              SideNavigationBarItem(
                icon: Icons.account_tree_sharp,
                label: 'Services',
              ),
              SideNavigationBarItem(
                icon: Icons.account_tree_sharp,
                label: 'Actions/Reactions',
              ),
              SideNavigationBarItem(
                icon: Icons.person,
                label: 'Account',
              ),
              SideNavigationBarItem(
                icon: Icons.settings,
                label: 'Settings',
              ),
            ],
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          Expanded(
            child: views.elementAt(_selectedIndex),
          )
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
