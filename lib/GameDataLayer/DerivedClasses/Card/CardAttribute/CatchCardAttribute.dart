import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/Enums/CardThrowResult.dart';

class CatchCardAttribute extends CardAttribute{
  @override
  int cardValue;

  @override
  String name;

  CatchCardAttribute({required this.name, required this.cardValue});

  @override
  CardThrowResult compare(CardAttribute other) {
    return CardThrowResult.compareHigherWins(this, other);
  }
}