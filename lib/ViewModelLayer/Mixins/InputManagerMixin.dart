import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/GameCard.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';

mixin InputManagerMixin{
  void selectCardForCurrentPlayer(GameCard gameCard);
  void selectCardAttributeForCurrentPlayer(CardAttribute cardAttribute);
  void enableSpecialModeForCurrentPlayer();
  void disableSpecialModeForCurrentPlayer();
  void applyCurrentPlayerThrow();
  Future<void> shuffleCards();
  Player getCurrentThrowingPlayer();
  Player getFirstThrowPlayerForCurrentRound();
  void moveToNextApplicableStep();
  int getCurrentRound();
  bool isGameOver();
  Player? getWinner();
}