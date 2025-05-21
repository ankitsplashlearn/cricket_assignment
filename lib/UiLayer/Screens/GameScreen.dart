import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/GameCard.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/SpecialMode.dart';
import 'package:cricket_card/GameDataLayer/DerivedClasses/Player/AiPlayer.dart';
import 'package:cricket_card/UiLayer/ScreenControllers/GameScreenController.dart';
import 'package:cricket_card/UiLayer/Screens/GameOverScreen.dart';
import 'package:cricket_card/UiLayer/Util/CommonWidgets.dart';
import 'package:cricket_card/UiLayer/Util/TextStyleUtil.dart';
import 'package:cricket_card/ViewModelLayer/InputManager.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  final InputManager inputManager;
  const GameScreen({super.key, required this.inputManager});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool _isGameDataLoaded = false;
  bool _errorOccurredLoadingData = false;

  late GameScreenController _gameScreenController;

  final double fontSize = 16;

  @override
  void initState() {
    super.initState();

    _gameScreenController = GameScreenController(
      inputManager: widget.inputManager,
    );
    loadGameData();
  }

  Future<void> loadGameData() async {
    bool errorOccurred = false;

    await _gameScreenController.inputManager.shuffleCards();

    setState(() {
      _isGameDataLoaded = true;
      _errorOccurredLoadingData = errorOccurred;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: _isGameDataLoaded
            ? (_errorOccurredLoadingData
                ? Text("Something went wrong! Please restart the game.")
                : _currentPlayerView())
            : Center(child: CircularProgressIndicator(color: Colors.white)),
      ),
    );
  }

  Widget _currentPlayerView() {
    Player currentPlayer =
        _gameScreenController.inputManager.getCurrentThrowingPlayer();
    Player firstThrowPlayer =
        _gameScreenController.inputManager.getFirstThrowPlayerForCurrentRound();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        keyValueRichText("Current turn", currentPlayer.name),
        keyValueRichText(
          "Health",
          currentPlayer.playerHealth.health.toString(),
        ),
        keyValueRichText(
          "Game Round",
          _gameScreenController.inputManager.getCurrentRound().toString(),
        ),
        if (currentPlayer != firstThrowPlayer)
          keyValueRichText(
            "Attributes selected by ${firstThrowPlayer.name}",
            firstThrowPlayer.selectedCardAttributes
                    .map((e) {
                      e.name;
                    })
                    .toList()
                    .toString() ??
                "",
          ),
        if (currentPlayer != firstThrowPlayer &&
            firstThrowPlayer.specialModes.isNotEmpty &&
            firstThrowPlayer.specialModes.first.isActiveNow)
          keyValueRichText(
              "Special Mode Activated by ${firstThrowPlayer.name}: ",
              firstThrowPlayer.specialModes.first.modeName),
        if (currentPlayer == firstThrowPlayer)
          _specialModeWidget(currentPlayer),
        Expanded(
          child: _cardsForCurrentThrowingPlayer(
            currentPlayer,
            firstThrowPlayer,
          ),
        ),
      ],
    );
  }

  Widget _specialModeWidget(Player currentPlayer) {
    if (currentPlayer.specialModes.isEmpty) {
      return SizedBox();
    }
    SpecialMode specialMode = currentPlayer.specialModes.first;
    if (!specialMode.canBeUsed(currentPlayer)) {
      return SizedBox();
    }
    bool isActive = specialMode.isActiveNow;
    return StatefulBuilder(builder: (context, localSetState) {
      return GestureDetector(
        child: Container(
          decoration:
              BoxDecoration(color: isActive ? Colors.green : Colors.grey),
          child: Text(
            specialMode.modeName,
            style: isActive
                ? TextStyleUtil.whiteTextStyle(fontSize: fontSize)
                : TextStyleUtil.blackTextStyle(fontSize: fontSize),
          ),
        ),
        onTap: () {
          localSetState(() {
            isActive = !isActive;
            if (isActive) {
              _gameScreenController.inputManager
                  .getCurrentThrowingPlayer()
                  .specialModes
                  .first
                  .activate();
            } else {
              _gameScreenController.inputManager
                  .getCurrentThrowingPlayer()
                  .specialModes
                  .first
                  .deActivate();
            }
          });
        },
      );
    });
  }

  Widget _cardsForCurrentThrowingPlayer(
    Player currentPlayer,
    Player firstThrowPlayer,
  ) {
    bool cardSelected = false;
    int countCardAttributesAllowedToSelect =
        currentPlayer.getCountCardAttributesAllowedToSelect();
    return StatefulBuilder(
      builder: (context, localSetState) {
        if (currentPlayer is AiPlayer && !cardSelected) {
          currentPlayer
              .choseCardsAndAttributes(currentPlayer == firstThrowPlayer)
              .then((_) {
            if (!mounted) return;
            localSetState(() {
              _moveToNextTurnOrRound();
            });
          });
        }
        Player _currentThrowingPlayer = _gameScreenController.inputManager
            .getCurrentThrowingPlayer();
        List<CardAttribute> selectedCardAttributes = _currentThrowingPlayer.selectedCardAttributes;
        return cardSelected
            ? Center(
                child: gameCardWidget(
                  gameCard: _currentThrowingPlayer.selectedCard,
                  selectedCardAttributes: selectedCardAttributes,
                  attributeTapCallback: (cardAttribute) {
                    if (currentPlayer is AiPlayer) {
                      return;
                    }
                    //reducing current counts
                    countCardAttributesAllowedToSelect--;
                    if(countCardAttributesAllowedToSelect > 0){
                      localSetState((){});
                    }else{
                      _gameScreenController.inputManager
                          .selectCardAttributeForCurrentPlayer(cardAttribute);

                      _moveToNextTurnOrRound();
                    }
                  },
                  attributeTapActive: true,
                ),
              )
            : SingleChildScrollView(
                child: Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.start,
                  runSpacing: 8,
                  runAlignment: WrapAlignment.start,
                  children: gameCardsWidget(
                    gameCards: currentPlayer.availableCards,
                    cardTapCallback: (gameCard) {
                      if (currentPlayer is AiPlayer) {
                        return;
                      }
                      localSetState(() {
                        if (currentPlayer == firstThrowPlayer) {
                          cardSelected = true;
                          _gameScreenController.inputManager
                              .selectCardForCurrentPlayer(gameCard);
                        } else {
                          _moveToNextTurnOrRound();
                        }
                      });
                    },
                  ),
                ),
              );
      },
    );
  }

  void _moveToNextTurnOrRound() {
    //This step is responsible for moving to next player throw or next round
    _gameScreenController.inputManager.moveToNextApplicableStep();
    if (_gameScreenController.inputManager.isGameOver()) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => GameOverScreen(
              winningPlayer: _gameScreenController.inputManager.getWinner(),
            ),
          ),
          (Route<dynamic> route) => false);
    } else {
      setState(() {});
    }
  }
}
