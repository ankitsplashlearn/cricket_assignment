import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/GameCard.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';

mixin GameRoundsHandler {
  void selectCardForCurrentPlayer(GameCard gameCard);
  void selectCardAttributeForCurrentPlayer(CardAttribute cardAttribute);
  void enableSpecialModeForCurrentPlayer();
  void disableSpecialModeForCurrentPlayer();
  void applyCurrentPlayerThrow();
  List<Player> evaluateRemainingPlayers();
  Future<void> shuffleCards();
  void moveToNextPlayerCardSelection();
  Player firstThrowPlayerForCurrentRound();
  bool isPlayerRemainingToThrowInCurrentRound();
  int getCurrentRound();
}
