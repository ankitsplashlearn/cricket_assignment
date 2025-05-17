import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/Enums/CardComparator.dart';

enum CardThrowResult{
  win,
  loss,
  draw;

  static CardThrowResult compare(CardAttribute currentPlayerCard, CardAttribute otherPlayerCard, CardComparator cardCompartor){
    switch(cardCompartor){
      case CardComparator.greater:
        return _compareHigherWins(currentPlayerCard, otherPlayerCard);
      case CardComparator.lesser:
        return _compareLowerWins(currentPlayerCard, otherPlayerCard);
    }
  }

  static CardThrowResult _compareHigherWins(CardAttribute currentPlayerCard, CardAttribute otherPlayerCard){
    if(currentPlayerCard.cardValue > otherPlayerCard.cardValue){
      return CardThrowResult.win;
    }else if(currentPlayerCard.cardValue < otherPlayerCard.cardValue){
      return CardThrowResult.loss;
    }else{
      return CardThrowResult.draw;
    }
  }

  static CardThrowResult _compareLowerWins(CardAttribute currentPlayerCard, CardAttribute otherPlayerCard){
    if(currentPlayerCard.cardValue < otherPlayerCard.cardValue){
      return CardThrowResult.win;
    }else if(currentPlayerCard.cardValue > otherPlayerCard.cardValue){
      return CardThrowResult.loss;
    }else{
      return CardThrowResult.draw;
    }
  }
}