import 'package:cricket_card/UiLayer/Enums/GameModeEnum.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  final GameModeEnum gameModeEnum;
  const GameScreen({super.key, required this.gameModeEnum});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool _isGameDataLoaded = false;
  bool _errorOccurredLoadingData = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> loadGameData() async {
    bool errorOccurred = false;

    setState(() {
      _isGameDataLoaded = true;
      _errorOccurredLoadingData = errorOccurred;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child:
            _isGameDataLoaded
                ? (_errorOccurredLoadingData
                    ? Text("error occurred")
                    : Text("game loaded"))
                : Center(child: CircularProgressIndicator(color: Colors.white)),
      ),
    );
  }
}
