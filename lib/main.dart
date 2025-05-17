import 'package:cricket_card/GameDataLayer/Util/DeckUtil.dart';
import 'package:cricket_card/UiLayer/Screens/GameModeSelectionScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());

}

Future<void> myCode() async {
  var deck = await DeckUtil.getDeckFromJson();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cricket Card',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      home: GameModeSelectionScreen()
    );
  }
}
