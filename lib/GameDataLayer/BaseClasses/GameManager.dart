import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/GameCard.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/GameDataLayer/Mixins/GameRoundsHandler.dart';
import 'package:cricket_card/GameDataLayer/Util/DeckUtil.dart';

class GameManager with GameRoundsHandler {
  late List<Player> _players;
  List<GameCard> _cardsAvailableInTheGame = [];
  int _currentTurn = 0; // Who selects the card first
  int _currentTurnOffset = 0; // Who is selecting the card
  int _currentGameRound = 0;

  GameManager({required List<Player> players}) {
    _players = players;
  }

  @override
  void enableSpecialModeForCurrentPlayer() {
    getCurrentThrowingPlayer().specialModes.first.activate();
  }

  @override
  void applyCurrentPlayerThrow() {
    // TODO: implement applyCurrentPlayerThrow
    // apply damage to all the players after this throw

    _currentTurnOffset = 0;
    _currentGameRound++;
    _currentTurn = _currentGameRound % _players.length;
  }

  @override
  void selectCardAttributeForCurrentPlayer(CardAttribute cardAttribute) {
    getCurrentThrowingPlayer().setSelectedCardAttribute(cardAttribute);
  }

  @override
  void selectCardForCurrentPlayer(GameCard gameCard) {
    getCurrentThrowingPlayer().setSelectedCard(gameCard);
  }

  @override
  void disableSpecialModeForCurrentPlayer() {
    getCurrentThrowingPlayer().specialModes.first.deActivate();
  }

  @override
  List<Player> evaluateRemainingPlayers() {
    _players.removeWhere((player) => player.playerHealth.health == 0);
    return _players;
  }

  @override
  Future<void> shuffleCards() async {
    _cardsAvailableInTheGame = await DeckUtil.getCricketCardsDeckFromJson();

    int cardsCount = _cardsAvailableInTheGame.length;
    int playersCount = _players.length;
    if (playersCount == 0) return;
    int cardsPerPlayer = cardsCount ~/ playersCount;

    _cardsAvailableInTheGame.shuffle();

    for (int i = 0; i < playersCount; i++) {
      int start = i * cardsPerPlayer;
      int end = start + cardsPerPlayer;

      List<GameCard> playerCards = _cardsAvailableInTheGame.sublist(start, end);

      _players[i].setCards(playerCards);
    }
  }

  @override
  void moveToNextPlayerCardSelection() {
    _currentTurnOffset = (_currentTurnOffset + 1) % (_players.length);
  }

  @override
  Player firstThrowPlayerForCurrentRound() {
    return getFirstThrowPlayerForCurrentRound();
  }

  Player getCurrentThrowingPlayer() {
    _currentTurn = _currentTurn % _players.length;
    int currentIndex = (_currentTurn + _currentTurnOffset) % _players.length;
    return _players[currentIndex];
  }

  Player getFirstThrowPlayerForCurrentRound() {
    _currentTurn = _currentTurn % _players.length;

    return _players[_currentTurn];
  }

  @override
  bool isPlayerRemainingToThrowInCurrentRound() {
    return _currentTurnOffset != _players.length - 1;
  }

  @override
  int getCurrentRound() {
    return _currentGameRound + 1;
  }
}
