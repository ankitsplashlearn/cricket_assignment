import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';

enum CardThrowResult{
  win,
  loss,
  draw;

  static CardThrowResult compareHigherWins(CardAttribute currentPlayerCard, CardAttribute otherPlayerCard){
    if(currentPlayerCard.cardValue > otherPlayerCard.cardValue){
      return CardThrowResult.win;
    }else if(currentPlayerCard.cardValue < otherPlayerCard.cardValue){
      return CardThrowResult.loss;
    }else{
      return CardThrowResult.draw;
    }
  }

  static CardThrowResult compareLowerWins(CardAttribute currentPlayerCard, CardAttribute otherPlayerCard){
    if(currentPlayerCard.cardValue < otherPlayerCard.cardValue){
      return CardThrowResult.win;
    }else if(currentPlayerCard.cardValue > otherPlayerCard.cardValue){
      return CardThrowResult.loss;
    }else{
      return CardThrowResult.draw;
    }
  }
}