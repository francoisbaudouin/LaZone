import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';

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
    Center(
      child: Container(
          height: 150,
          width: 300,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromARGB(255, 3, 3, 3),
                    Color.fromARGB(255, 129, 64, 233),
                    Color.fromARGB(255, 33, 36, 242),
                  ])
          ),
          child: const Center(
                  child: Text('Discord',
                      textAlign : TextAlign.center,
                      style: TextStyle(color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  ),
          ),
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
        title: const Center(child: Text('Title', textAlign: TextAlign.center)),
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
                icon: Icons.dashboard,
                label: 'Dashboard',
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