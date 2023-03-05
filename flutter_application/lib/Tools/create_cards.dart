import 'package:flutter/material.dart';
import 'text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../ServicePage/choose_page.dart';
import 'dart:convert';
import 'global.dart';

class ServiceCards extends StatelessWidget {
  const ServiceCards(
      {Key? key,
      required this.title,
      required this.imagePath,
      required this.textbutton,
      required this.colorButton})
      : super(key: key);
  final String title;
  final String imagePath;
  final String textbutton;
  final Color colorButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/parchemin2.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 85,
          ),
          Container(
            constraints: const BoxConstraints(maxHeight: 300),
            child: Image.asset(imagePath, fit: BoxFit.fill),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(100, 0, 100, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    title,
                    style: headlineSecondaryTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FloatingActionButton.extended(
                  onPressed: () {
                    chooseConnection(title, context);
                  },
                  backgroundColor: colorButton,
                  label: Text(textbutton,
                      style: const TextStyle(fontFamily: "OldLondon")),
                  icon: const Icon(Icons.navigate_next),
                  heroTag: null,
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CreateCardsOneChoice extends StatefulWidget {
  CreateCardsOneChoice({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.textbutton,
    required this.colorButton,
    required this.choice,
    required this.choiceList,
  }) : super(key: key);

  final String title;
  final String imagePath;
  final String textbutton;
  final Color colorButton;
  final String choice;
  final String choiceList;

  @override
  _CreateCardsOneChoiceState createState() => _CreateCardsOneChoiceState();
}

class ListItem {
  final String name;
  ListItem({
    required this.name,
  });
}

class _CreateCardsOneChoiceState extends State<CreateCardsOneChoice> {
  String dropdownValue = '';
  late List<String> itemsNames = [];
  String choiceList = '';
  String selectedValue = '';

  @override
  void initState() {
    super.initState();
    final jsonString = Future.delayed(Duration.zero, () => widget.choiceList);
    jsonString.then((value) {
      choiceList = value;
      final items = loadListFromJson(value);
      dropdownValue = items[0].name;
      itemsNames = items.map((item) => item.name).toList();
      selectedValue = dropdownValue;
      setState(() {});
    });
  }

  List<ListItem> loadListFromJson(String jsonString) {
    final choiceList = json.decode(jsonString);
    List<Map<String, dynamic>> items =
        List<Map<String, dynamic>>.from(choiceList);
    return items
        .map((item) => ListItem(
              name: item["name"],
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/parchemin2.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 110,
          ),
          Container(
            constraints: const BoxConstraints(maxHeight: 300),
            child: Image.asset(widget.imagePath, fit: BoxFit.fill),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(100, 0, 100, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    widget.title,
                    style: headlineSecondaryTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Text(
                    widget.choice,
                    style: lineSecondaryTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButton(
                  value: dropdownValue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: itemsNames.map((itemName) {
                    return DropdownMenuItem(
                      value: itemName,
                      child: Text(itemName),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      selectedValue = newValue;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                FloatingActionButton.extended(
                  onPressed: () {
                    if (widget.choice == "Choose a repository:")
                      area.actionParam = selectedValue;
                    else if (widget.choice == "Choose a server:")
                      area.reactionParam = selectedValue;
                    else if (widget.choice == "Choose a subreddit:" &&
                        area.actionServiceChoose == "Reddit")
                      area.actionParam = selectedValue;
                    else if (widget.choice == "Choose a subreddit:" &&
                        area.reactionServiceChoose == "Reddit")
                      area.reactionParam = selectedValue;
                    chooseConnection(widget.title, context);
                  },
                  backgroundColor: widget.colorButton,
                  label: Text(widget.textbutton,
                      style: const TextStyle(fontFamily: "OldLondon")),
                  icon: const Icon(Icons.navigate_next),
                  heroTag: null,
                ),
                const SizedBox(
                  height: 90,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CreateCardsTwoChoice extends StatefulWidget {
  CreateCardsTwoChoice(
      {Key? key,
      required this.title,
      required this.imagePath,
      required this.textbutton,
      required this.colorButton,
      required this.choiceOne,
      required this.choiceTwo,
      required this.SecondChoiceList})
      : super(key: key);
  final String title;
  final String imagePath;
  final String textbutton;
  final Color colorButton;
  final String choiceOne;
  final String choiceTwo;
  final String SecondChoiceList;

  @override
  _CreateCardsTwoChoiceState createState() => _CreateCardsTwoChoiceState();
}

class _CreateCardsTwoChoiceState extends State<CreateCardsTwoChoice> {
  String dropdownValue1 = '';
  late List<String> itemsNames1 = [];
  String selectedServer = '';
  String SecondChoiceList = '';

  String dropdownValue2 = '';
  late List<String> itemsNames2 = [];
  String selectedValue2 = '';

  @override
  void initState() {
    super.initState();
    final jsonString1 = Future.delayed(Duration.zero, () => DiscordServerList);
    jsonString1.then((value) {
      DiscordServerList = value;
      final items = loadListFromJson(value);
      dropdownValue1 = items[0].name;
      itemsNames1 = items.map((item) => item.name).toList();
      selectedServer = dropdownValue1;
      setState(() {});
    });

    final jsonString2 =
        Future.delayed(Duration.zero, () => widget.SecondChoiceList);
    jsonString2.then((value) {
      SecondChoiceList = value;
      final items = loadListFromJson(value);
      dropdownValue2 = items[0].name;
      itemsNames2 = items.map((item) => item.name).toList();
      selectedValue2 = dropdownValue2;
      setState(() {});
    });
  }

  List<ListItem> loadListFromJson(String jsonString) {
    final choiceList = jsonDecode(jsonString);
    List<Map<String, dynamic>> items =
        List<Map<String, dynamic>>.from(choiceList);
    return items
        .map((item) => ListItem(
              name: item["name"],
            ))
        .toList();
  }

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.0),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/parchemin2.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 85,
          ),
          Container(
            constraints: const BoxConstraints(maxHeight: 300),
            child: Image.asset(widget.imagePath, fit: BoxFit.fill),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    widget.title,
                    style: headlineSecondaryTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    widget.choiceOne,
                    style: lineSecondaryTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                DropdownButton(
                  value: dropdownValue1,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: itemsNames1.map((itemName) {
                    return DropdownMenuItem(
                      value: itemName,
                      child: Text(itemName),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue1 = newValue!;
                      selectedServer = newValue;
                      final tmp = globalActionsReactionsParameters["Discord"];
                      for (var i = 0; i < tmp.length; i++) {
                        var element = tmp[i];
                        if (element["name"] == selectedServer) {
                          SecondChoiceList = jsonEncode(element["channels"]);
                          break;
                        }
                      }
                      itemsNames2 = loadListFromJson(SecondChoiceList)
                          .map((item) => item.name)
                          .toList();
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    widget.choiceTwo,
                    style: lineSecondaryTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                DropdownButton(
                  value: dropdownValue2,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: itemsNames2.map((itemName) {
                    return DropdownMenuItem(
                      value: itemName,
                      child: Text(itemName),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue2 = newValue!;
                      selectedValue2 = newValue;
                    });
                  },
                ),
                FloatingActionButton.extended(
                  onPressed: () {
                    if (widget.choiceOne == "Choose a server:" &&
                        widget.choiceTwo == "Choose a channel:") {
                      final tmp = jsonDecode(SecondChoiceList);
                      String selectedChannelId = "";
                      for (var i = 0; i < tmp.length; i++) {
                        var element = tmp[i];
                        if (element["name"] == selectedValue2) {
                          selectedChannelId = element["id"];
                          break;
                        }
                      }
                      area.reactionParam = "$selectedChannelId";
                    }
                    chooseConnection(widget.title, context);
                  },
                  backgroundColor: widget.colorButton,
                  label: Text(widget.textbutton,
                      style: const TextStyle(fontFamily: "OldLondon")),
                  icon: const Icon(Icons.navigate_next),
                  heroTag: null,
                ),
                const SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
