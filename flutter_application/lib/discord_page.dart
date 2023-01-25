import 'package:flutter/material.dart';
import 'navigate_bar.dart';

class DiscordPage extends StatelessWidget {
  const DiscordPage({super.key});
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
              child: Container(
                height: 200,
                width: 300,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
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