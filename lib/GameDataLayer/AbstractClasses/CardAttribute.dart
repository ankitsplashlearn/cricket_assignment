import 'package:cricket_card/GameDataLayer/Enums/CardComparator.dart';
import 'package:cricket_card/GameDataLayer/Enums/CardThrowResult.dart';

abstract class CardAttribute {
  String get name;
  dynamic get cardValue;
  CardComparator get cardComparator;

  CardThrowResult compare(CardAttribute other) {
    return CardThrowResult.compare(this, other, cardComparator);
  }
}
