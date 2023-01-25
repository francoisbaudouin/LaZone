import 'package:flutter/material.dart';
import 'package:flutter_application/discord_page.dart';
import 'navigate_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: const Color(0xffF57752),
        elevation: 0.0,
        title: const Text('Title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DiscordPage()),
                  );
              },
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
            )
          ],
        ),
      ),
    );
  }
}