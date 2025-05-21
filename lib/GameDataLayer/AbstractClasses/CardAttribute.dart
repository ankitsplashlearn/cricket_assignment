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
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CardAttribute && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;


  @override
  String toString() {
    return "Card Attribute: name = $name, cardValue = ${cardValue.toString()}, cardComparator = ${cardComparator.toString()}";
  }
}
