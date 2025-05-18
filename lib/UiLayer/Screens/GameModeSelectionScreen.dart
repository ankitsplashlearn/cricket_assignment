import 'package:cricket_card/GameDataLayer/AbstractClasses/SpecialMode.dart';
import 'package:cricket_card/GameDataLayer/DerivedClasses/SpecialMode/FreeHitMode.dart';
import 'package:cricket_card/GameDataLayer/Util/SpecialModeUtil.dart';
import 'package:cricket_card/UiLayer/Enums/GameModeEnum.dart';
import 'package:cricket_card/UiLayer/Enums/GameSetupPhaseEnum.dart';
import 'package:cricket_card/UiLayer/ScreenControllers/GameModeSelectionScreenController.dart';
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
  GameSetupPhaseEnum _gameSetupPhaseEnum = GameSetupPhaseEnum.gameModeSelection;
  final GameModeSelectionScreenController _gameModeSelectionScreenController =
      GameModeSelectionScreenController();

  final TextEditingController _player1Controller = TextEditingController();
  final TextEditingController _player2Controller = TextEditingController();

  final _availableModes = SpecialModeUtil.getAvailableSpecialModes();

  SpecialMode? _selectedSpecialMode1;
  SpecialMode? _selectedSpecialMode2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.black),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Cricket Card Game for Cricket Lovers",
                style: TextStyleUtil.whiteTextStyle(fontSize: 32, bold: true),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top: 64, left: 64, right: 64),
                child: _gameModeSetupWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gameModeSetupWidget() {
    switch (_gameSetupPhaseEnum) {
      case GameSetupPhaseEnum.gameModeSelection:
        return _gameModeSelectionWidget();
      case GameSetupPhaseEnum.playerDetailsForm:
        return _playerDetailsFormWidget();
    }
  }

  Widget _gameModeSelectionWidget() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        gameModeSelectionCard("Player vs Computer", () {
          _gameModeSelectionScreenController.setGameModeEnum(
            GameModeEnum.playerVsComputer,
          );
          _player2Controller.text = "Computer";
          _selectedSpecialMode2 = _availableModes.firstOrNull;
          _goToPhase(GameSetupPhaseEnum.playerDetailsForm);
        }),
        gameModeSelectionCard("Player vs Player", () {
          _gameModeSelectionScreenController.setGameModeEnum(
            GameModeEnum.playerVsPlayer,
          );
          _player2Controller.text = "";
          _selectedSpecialMode2 = null;
          _goToPhase(GameSetupPhaseEnum.playerDetailsForm);
        }),
      ],
    );
  }

  Widget _playerDetailsFormWidget() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 4),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          //Back button
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  _goToPhase(GameSetupPhaseEnum.gameModeSelection);
                },
                icon: Icon(Icons.arrow_back, color: Colors.white, size: 40),
              ),
              SizedBox(width: 16),
              Text(
                "Setup game(Player 1 will have the first throw)",
                style: TextStyleUtil.whiteTextStyle(fontSize: 28),
              ),
            ],
          ),
          Container(height: 4, color: Colors.white),
          //Player form
          Expanded(
            child: SingleChildScrollView(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildPlayerForm(
                    "Player 1",
                    _player1Controller,
                    (mode) {
                      _selectedSpecialMode1 = mode;
                    },
                    _availableModes,
                    _availableModes.firstOrNull,
                  ),
                  buildPlayerForm(
                    _getSecondPlayerName(),
                    _player2Controller,
                    (mode) {
                      _selectedSpecialMode2 = mode;
                    },
                    _availableModes,
                    _availableModes.firstOrNull,
                  ),
                ],
              ),
            ),
          ),
          //Submit button
          Container(height: 4, color: Colors.white),
          TextButton(
            onPressed: () {
              _openGameScreen();
            },
            child: Text(
              "Start Game",
              style: TextStyleUtil.whiteTextStyle(fontSize: 32, bold: true),
            ),
          ),
        ],
      ),
    );
  }

  String _getSecondPlayerName() {
    if (_gameModeSelectionScreenController.getGameModeEnum() ==
        GameModeEnum.playerVsComputer) {
      return "Computer";
    } else {
      return "Player 2";
    }
  }

  void _openGameScreen() {
    List<String> inputErrors = [];

    if (_player1Controller.text.isEmpty) {
      inputErrors.add("Player 1 name is required.");
    }

    if (_player2Controller.text.isEmpty) {
      inputErrors.add("Player 2 name is required.");
    }

    if (_selectedSpecialMode1 == null) {
      inputErrors.add("Please select a special mode for Player 1.");
    }

    if (_selectedSpecialMode2 == null) {
      inputErrors.add("Please select a special mode for Player 2.");
    }

    if (inputErrors.isEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => GameScreen(
                gameModeEnum:
                    _gameModeSelectionScreenController.getGameModeEnum(),
                // Add other required params like player names and special modes if needed
              ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Please provide all fields"),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: inputErrors.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.error, color: Colors.red),
                    title: Text(inputErrors[index]),
                  );
                },
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  void _goToPhase(GameSetupPhaseEnum phase) {
    setState(() {
      _gameSetupPhaseEnum = phase;
    });
  }
}
