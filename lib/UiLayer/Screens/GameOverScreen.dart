import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/UiLayer/Screens/GameModeSelectionScreen.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatefulWidget {
  final Player? winningPlayer;
  const GameOverScreen({super.key, required this.winningPlayer});

  @override
  State<GameOverScreen> createState() => _GameOverScreenState();
}

class _GameOverScreenState extends State<GameOverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Text("Game Over"),
          Text("${widget.winningPlayer?.name ?? "NA"} won!"),
          TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameModeSelectionScreen(),
                    ),
                    (_) => false);
              },
              child: Text("Go to Homepage"))
        ],
      ),
    );
  }
}
