import 'package:cricket_card/GameDataLayer/Enums/CardComparator.dart';

abstract class CardAttribute {
  String get name;
  dynamic get cardValue;
  CardComparator get cardComparator;
  CardCompareResultType compare(CardAttribute other);

  @override
  String toString() {
    return "Card Attribute: name = $name, cardValue = ${cardValue.toString()}, cardComparator = ${cardComparator.toString()}";
  }
}
