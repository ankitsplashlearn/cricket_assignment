import 'package:cricket_card/GameDataLayer/Enums/CardThrowResult.dart';

abstract class CardAttribute {
  String get name;
  dynamic get cardValue;
  CardThrowResult compare(CardAttribute other);
}
