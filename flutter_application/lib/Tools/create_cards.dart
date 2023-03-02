import 'package:flutter/material.dart';
import 'text.dart';
import '../ServicePage/choose_page.dart';

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
                  child: Text(title, style: headlineSecondaryTextStyle, textAlign: TextAlign.center,),
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

class CreateCardsOneChoice extends StatelessWidget {
  CreateCardsOneChoice(
      {Key? key,
      required this.title,
      required this.imagePath,
      required this.textbutton,
      required this.colorButton,
      required this.choice})
      : super(key: key);
  final String title;
  final String imagePath;
  final String textbutton;
  final Color colorButton;
  final String choice;

  String dropdownvalue = 'Item 1';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

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
          const SizedBox(height: 110,),
          Container(
            constraints: const BoxConstraints(maxHeight: 300),
            child: Image.asset(imagePath, fit: BoxFit.fill),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(title, style: headlineSecondaryTextStyle),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Text(choice, style: lineSecondaryTextStyle),
                ),
                DropdownButton(
                value: dropdownvalue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                return DropdownMenuItem(
                value: items,
                child: Text(items),
                );
                }).toList(),
                onChanged: (String? newValue) {
                },
                ),
                const SizedBox(height: 10,),
                FloatingActionButton.extended(
                    onPressed: () {
                      chooseConnection(title, context);
                    },
                    backgroundColor: colorButton,
                    label: Text(textbutton, style: const TextStyle(fontFamily: "OldLondon")),
                    icon: const Icon(Icons.navigate_next),
                    heroTag: null,
                ),
                const SizedBox(height: 70,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CreateCardsTwoChoice extends StatelessWidget {
  CreateCardsTwoChoice(
      {Key? key,
      required this.title,
      required this.imagePath,
      required this.textbutton,
      required this.colorButton,
      required this.choiceOne,
      required this.choiceTwo,})
      : super(key: key);
  final String title;
  final String imagePath;
  final String textbutton;
  final Color colorButton;
  final String choiceOne;
  final String choiceTwo;

  String dropdownvalue = 'Item 1';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

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
          const SizedBox(height: 85,),
          Container(
            constraints: const BoxConstraints(maxHeight: 300),
            child: Image.asset(imagePath, fit: BoxFit.fill),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(title, style: headlineSecondaryTextStyle),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(choiceOne, style: lineSecondaryTextStyle),
                ),
                DropdownButton(
                value: dropdownvalue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                return DropdownMenuItem(
                value: items,
                child: Text(items),
                );
                }).toList(),
                onChanged: (String? newValue) {
                },
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(choiceTwo, style: lineSecondaryTextStyle),
                ),
                DropdownButton(
                value: dropdownvalue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                return DropdownMenuItem(
                value: items,
                child: Text(items),
                );
                }).toList(),
                onChanged: (String? newValue) {
                },
                ),
                FloatingActionButton.extended(
                    onPressed: () {
                      chooseConnection(title, context);
                    },
                    backgroundColor: colorButton,
                    label: Text(textbutton, style: const TextStyle(fontFamily: "OldLondon")),
                    icon: const Icon(Icons.navigate_next),
                    heroTag: null,
                ),
                const SizedBox(height: 50,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}