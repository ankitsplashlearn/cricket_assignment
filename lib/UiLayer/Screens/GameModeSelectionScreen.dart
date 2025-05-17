import 'package:cricket_card/UiLayer/Enums/GameModeEnum.dart';
import 'package:cricket_card/UiLayer/Screens/GameScreen.dart';
import 'package:cricket_card/UiLayer/Util/CommonWidgets.dart';
import 'package:cricket_card/UiLayer/Util/TextStyleUtil.dart';
import 'package:flutter/material.dart';

class GameModeSelectionScreen extends StatefulWidget {
  const GameModeSelectionScreen({super.key});

  @override
  State<GameModeSelectionScreen> createState() =>
      _GameModeSelectionScreenState();
}

class _GameModeSelectionScreenState extends State<GameModeSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.black),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Text(
                "Cricket Card Game for Cricket Lovers",
                style: TextStyleUtil.whiteTextStyle(fontSize: 32, bold: true),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                gameModeSelectionCard("Player vs Computer", (){
                  openGameScreen(GameModeEnum.playerVsComputer);
                }),
                gameModeSelectionCard("Player vs Player", (){
                  openGameScreen(GameModeEnum.playerVsPlayer);
                }),
              ],
            )
          ],
        ),
      ),
    );
  }

  void openGameScreen(GameModeEnum selectedGameMode){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GameScreen(gameModeEnum: selectedGameMode,),
      ),
    );
  }
}
