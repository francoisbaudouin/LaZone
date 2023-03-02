import 'dart:convert';

String globalFirstname = "";
String globalLastname = "";
String globalPseudo = "";
String globalEmail = "";
String globalPassword = "";
String serverAddress = "localhost:8080";

List<Map<String, dynamic>> areas = List<Map<String, dynamic>>.from(
  jsonDecode('''[]'''),
);
