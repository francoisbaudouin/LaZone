import 'package:flutter/material.dart';
import 'package:flutter_application/Tools/text.dart';
import 'package:side_navigation/side_navigation.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'ServicePage/create_cards.dart';
import 'Tools/color.dart';
import 'ServicePage/action_reaction_page.dart';
import 'profile_page.dart';

const EdgeInsets blockMargin = EdgeInsets.fromLTRB(10, 0, 10, 32);

class FlutterNewRow extends StatelessWidget {
  const FlutterNewRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: blockMargin,
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
            rowFit: FlexFit.tight,
            child: FlutterNewCard(
              title: "Github",
              imagePath: "assets/images/github-logo.png",
              textbutton :  button.buttonConnectionGitHub,
              colorButton : buttoncol.colbuttonConnectionGitHub,
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: FlutterNewCard(
              title: "Trello",
              imagePath: "assets/images/Trello-Symbole.jpg",
              textbutton :  button.buttonConnectionTrello,
              colorButton : buttoncol.colbuttonConnectionTrello,
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: FlutterNewCard(
              title: "Microsoft Planner",
              imagePath: "assets/images/Planner-logo.jpg",
              textbutton :  button.buttonConnectionPlanner,
              colorButton : buttoncol.colbuttonConnectionPlanner,
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
        child : FlutterNewRow(),
    ),
    const Center(
      child: CreateactionReactionCards(),
    ),
    const Center(
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
        toolbarHeight: 80.0,
        backgroundColor: const Color.fromARGB(255, 127, 184, 250),
        elevation: 0.0,
        title: const Center(child: Text('LaZone', textAlign: TextAlign.center)),
        leading: IconButton(
          icon: const Icon(Icons.download),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
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
            footer: const SideNavigationBarFooter(label: Text('Reduce')),
            selectedIndex: _selectedIndex,
            items: const [
              SideNavigationBarItem(
                icon: Icons.integration_instructions,
                label: 'Action service',
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
