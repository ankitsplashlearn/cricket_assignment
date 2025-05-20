import 'package:cricket_card/GameDataLayer/Enums/CardComparator.dart';
import 'package:cricket_card/GameDataLayer/Enums/CardThrowResult.dart';

abstract class CardAttribute {
  String get name;
  dynamic get cardValue;
  CardComparator get cardComparator;
  CardCompareResultType compare(CardAttribute other);

  CardThrowResult compareAttributes(CardAttribute other){
    CardThrowResult result = CardThrowResult.draw;
    switch(cardComparator){
      case CardComparator.greater:
        if(cardValue > other.cardValue){
          result = CardThrowResult.win;
        }else if(other.cardValue > cardValue){
          result = CardThrowResult.loss;
        }
      case CardComparator.lesser:
        if(cardValue < other.cardValue){
          result = CardThrowResult.win;
        }else if(other.cardValue < cardValue){
          result = CardThrowResult.loss;
        }
    }

    return result;
  }

  @override
  String toString() {
    return "Card Attribute: name = $name, cardValue = ${cardValue.toString()}, cardComparator = ${cardComparator.toString()}";
  }
}
