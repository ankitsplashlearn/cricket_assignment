import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/GameCard.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/GameDataLayer/Enums/CardComparator.dart';
import 'package:cricket_card/GameDataLayer/Enums/CardThrowResult.dart';

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

  CardThrowResult gameRoundResult(CardCompareResultType cardCompareResultType,
      CardComparator cardComparator) {
    switch (cardComparator) {
      case CardComparator.greater:
        switch (cardCompareResultType) {
          case CardCompareResultType.greaterThan:
            return CardThrowResult.win;
          case CardCompareResultType.equalTo:
            return CardThrowResult.draw;
          case CardCompareResultType.lessThan:
            return CardThrowResult.loss;
        }
      case CardComparator.lesser:
        switch (cardCompareResultType) {
          case CardCompareResultType.greaterThan:
            return CardThrowResult.loss;
          case CardCompareResultType.equalTo:
            return CardThrowResult.draw;
          case CardCompareResultType.lessThan:
            return CardThrowResult.win;
        }
    }
  }
}
