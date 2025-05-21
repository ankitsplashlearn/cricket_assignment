import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/GameCard.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/SpecialMode.dart';
import 'package:cricket_card/GameDataLayer/DerivedClasses/SpecialMode/DefaultMode.dart';
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
    Player currentThrowingPlayer = getCurrentThrowingPlayer();
    currentThrowingPlayer.specialModes.first.activate();
    print(
        "${currentThrowingPlayer.name} activated ${currentThrowingPlayer.specialModes.first.modeName}");
  }

  @override
  void applyCurrentRoundFirstPlayerThrow() {
    print("Card throw evaluation for round ${_currentGameRound + 1}");
    bool isHealthReducedForCurrentPlayer = false;
    Player currentThrowingPlayer = getFirstThrowPlayerForCurrentRound();
    bool isSpecialModeActive =
        currentThrowingPlayer.specialModes.first.isActiveNow;
    SpecialMode activeSpecialMode = isSpecialModeActive
        ? currentThrowingPlayer.specialModes.first
        : DefaultMode();
    for (var player in _players) {
      if (player != currentThrowingPlayer) {
        isHealthReducedForCurrentPlayer = activeSpecialMode.applyModeEffect(
            currentThrowingPlayer, player, isHealthReducedForCurrentPlayer);
        player.removePlayedCards();
        player.removeSpecialModesUsed();
        print("${player.name}`s health: ${player.playerHealth.health}");
      }
    }

    currentThrowingPlayer.removePlayedCards();
    currentThrowingPlayer.removeSpecialModesUsed();

    print(
        "${currentThrowingPlayer.name}`s health: ${currentThrowingPlayer.playerHealth.health}");

    _currentTurnOffset = 0;
    _currentGameRound++;
    _currentTurn = _currentGameRound % _players.length;
  }

  @override
  void selectCardAttributeForCurrentPlayer(CardAttribute cardAttribute) {
    Player currentThrowingPlayer = getCurrentThrowingPlayer();
    currentThrowingPlayer.addToSelectedCardAttribute(cardAttribute);
  }

  @override
  void selectCardForCurrentPlayer(GameCard gameCard) {
    Player currentThrowingPlayer = getCurrentThrowingPlayer();
    currentThrowingPlayer.setSelectedCard(gameCard);
  }

  @override
  void disableSpecialModeForCurrentPlayer() {
    Player currentThrowingPlayer = getCurrentThrowingPlayer();
    currentThrowingPlayer.specialModes.first.deActivate();
    print(
        "${currentThrowingPlayer.name} deactivated ${currentThrowingPlayer.specialModes.first.modeName}");
  }

  @override
  List<Player> evaluateRemainingPlayers() {
    _players.removeWhere((player) =>
        player.playerHealth.health == 0 || player.availableCards.isEmpty);
    print("${_players.length} players remaining");
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
    print(
        "Turn for ${_players[(_currentTurn + _currentTurnOffset) % _players.length].name}");
  }

  @override
  Player firstThrowPlayerForCurrentRound() {
    return getFirstThrowPlayerForCurrentRound();
  }

  //player who selects the card now
  Player getCurrentThrowingPlayer() {
    _currentTurn = _currentTurn % _players.length;
    int currentIndex = (_currentTurn + _currentTurnOffset) % _players.length;
    return _players[currentIndex];
  }

  //from whom to compare
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
