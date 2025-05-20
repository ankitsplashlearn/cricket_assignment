import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/UiLayer/ScreenControllers/GameScreenController.dart';
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
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child:
            _isGameDataLoaded
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
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _currentPlayerDetail("Current turn: ", currentPlayer.name),
        _currentPlayerDetail(
          "Health: ",
          currentPlayer.playerHealth.health.toString(),
        ),
        if(currentPlayer != firstThrowPlayer)
          _currentPlayerDetail(
            "Attribute selected by ${firstThrowPlayer.name}: ${firstThrowPlayer.selectedCardAttribute?.name}",
            currentPlayer.playerHealth.health.toString(),
          ),
        Expanded(
          child: _cardsForCurrentThrowingPlayer(
            currentPlayer,
            firstThrowPlayer,
          ),
        ),
      ],
    );
  }

  Widget _currentPlayerDetail(String title, String value) {
    return RichText(
      text: TextSpan(
        text: title,
        children: [
          TextSpan(
            text: value,
            style: TextStyleUtil.yellowTextStyle(
              fontSize: fontSize,
              bold: true,
            ),
          ),
        ],
        style: TextStyleUtil.whiteTextStyle(fontSize: fontSize),
      ),
    );
  }

  Widget _cardsForCurrentThrowingPlayer(
    Player currentPlayer,
    Player firstThrowPlayer,
  ) {
    bool cardSelected = false;
    return StatefulBuilder(
      builder: (context, localSetState) {
        return cardSelected
            ? Center(
              child: gameCardWidget(
                gameCard:
                    _gameScreenController.inputManager
                        .getCurrentThrowingPlayer()
                        .selectedCard,
                attributeTapCallback: (cardAttribute) {
                  _gameScreenController.inputManager
                      .selectCardAttributeForCurrentPlayer(cardAttribute);

                  //This step is responsible for moving to next player throw or next round
                  _gameScreenController.inputManager.moveToNextApplicableStep();
                  setState(() {});
                },
              ),
            )
            : SingleChildScrollView(
              child: Wrap(
                children: gameCardWidgets(
                  gameCards: currentPlayer.availableCards,
                  cardTapCallback: (gameCard) {
                    localSetState(() {
                      cardSelected = true;
                      _gameScreenController.inputManager
                          .selectCardForCurrentPlayer(gameCard);
                    });
                  },
                ),
              ),
            );
      },
    );
  }
}
