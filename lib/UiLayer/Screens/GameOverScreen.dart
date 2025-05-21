import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/UiLayer/Screens/GameModeSelectionScreen.dart';
import 'package:cricket_card/UiLayer/Util/TextStyleUtil.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatefulWidget {
  final Player? winningPlayer;
  const GameOverScreen({super.key, required this.winningPlayer});

  @override
  State<GameOverScreen> createState() => _GameOverScreenState();
}

class _GameOverScreenState extends State<GameOverScreen> {

  String winner = "";

  @override
  void initState() {
    super.initState();

    if(widget.winningPlayer != null){
      winner = "${widget.winningPlayer!.name} won!";
    }else{
      winner = "Draw!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            Text("Game Over", style: TextStyleUtil.whiteTextStyle(fontSize: 32),),
            Text(winner, style: TextStyleUtil.yellowTextStyle(fontSize: 48)),
            TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GameModeSelectionScreen(),
                      ),
                      (_) => false);
                },
                child: Text("Go to Homepage", style: TextStyleUtil.whiteTextStyle(fontSize: 48)))
          ],
        ),
      ),
    );
  }
}
