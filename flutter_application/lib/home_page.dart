import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'discord_page.dart';

const Color primary = Color(0xFF1389FD);
const Color primaryDark = Color(0xFF0276e8);
const Color primaryLight = Color(0xFFE7F8FF);

const Color textPrimary = Color(0xFF4A4A4A);

const Color buttonPrimaryDark = Color(0xFF0075E6);
const Color buttonPrimaryDarkPressed = Color(0xFF006ED9);
const Color buttonPrimaryPressedOutline = Color(0xFF8DCDFD);

const Color background = Color(0xFFF8F9FA);
const Color backgroundDark = Color(0xFF303c42);
const Color border = Color(0x20000000);
const String fontFamily = "Google Sans";

const TextStyle headlineTextStyle = TextStyle(
    fontSize: 44, color: textPrimary, height: 1.2, fontFamily: fontFamily);

const TextStyle headlineSecondaryTextStyle = TextStyle(
    fontSize: 28, color: textPrimary, height: 1.2, fontFamily: fontFamily);

const TextStyle bodyTextStyle = TextStyle(
    fontSize: 16, color: textPrimary, height: 1.5, fontFamily: "Roboto");

TextStyle bodyLinkTextStyle = bodyTextStyle.copyWith(color: primary);

const TextStyle buttonTextStyle = TextStyle(
    fontSize: 18, color: Colors.white, height: 1, fontFamily: fontFamily);

Future<bool> openUrl(String url, {bool newWindow = false}) async {
    debugPrint("Could not launch $url");
    return false;
}

class FlutterNewsCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String linkUrl;

  const FlutterNewsCard(
      {Key? key,
      required this.title,
      required this.imagePath,
      required this.linkUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: border)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            constraints: const BoxConstraints(maxHeight: 400),
            child: Image.asset(imagePath, fit: BoxFit.fitWidth),
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
                  onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DiscordPage()),
                  );
              },
                  child: Text("Click here to choose this service", style: bodyLinkTextStyle),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

const EdgeInsets blockMargin = EdgeInsets.fromLTRB(10, 0, 10, 32);
class FlutterNewsRow extends StatelessWidget {
  const FlutterNewsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: blockMargin,
      child: ResponsiveRowColumn(
        layout: ResponsiveWrapper.of(context).isSmallerThan("DESKTOP")
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        rowCrossAxisAlignment: CrossAxisAlignment.start,
        rowSpacing: 25,
        columnSpacing: 25,
        children: const [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: FlutterNewsCard(
              title: "Github",
              imagePath: "../assets/images/github-logo.png",
              linkUrl:
                  "https://developers.googleblog.com/2019/12/flutter-ui-ambient-computing.html",
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: FlutterNewsCard(
              title: "Trello",
              imagePath: "../assets/images/Trello-Symbole.jpg",
              linkUrl:
                  "https://medium.com/flutter/announcing-codepen-support-for-flutter-bb346406fe50",
            ),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowFit: FlexFit.tight,
            child: FlutterNewsCard(
              title: "Microsoft Planner",
              imagePath: "../assets/images/Planner-logo.jpg",
              linkUrl:
                  "https://medium.com/flutter/announcing-codepen-support-for-flutter-bb346406fe50",
            ),
          ),
        ],
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
    const Center(
      child: SingleChildScrollView(
        child : FlutterNewsRow(),
      ),
    ),
    const Center(
      child: Text('Account'),
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
          icon: const Icon(Icons.accessibility),
          onPressed: () {},
        ),
      ),
        body: Row(
        children: [
          SideNavigationBar(
            header: const SideNavigationBarHeader(
              subtitle: Text(''),
              title: Text("\nMenu"),
              image: CircleAvatar(
                child: Icon(Icons.home),
              ),
            ),
            footer: const SideNavigationBarFooter(
              label: Text('Reduce')
            ),
            selectedIndex: _selectedIndex,
            items: const [
              SideNavigationBarItem(
                icon: Icons.integration_instructions,
                label: 'Action service',
              ),
              SideNavigationBarItem(
                icon: Icons.alarm_on,
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