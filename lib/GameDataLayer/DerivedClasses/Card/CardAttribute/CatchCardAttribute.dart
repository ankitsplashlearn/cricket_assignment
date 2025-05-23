import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/Enums/CardComparator.dart';
import 'package:cricket_card/helper/helper_functions.dart';

class CatchCardAttribute extends CardAttribute {
  @override
  String get name => 'Catches';

  @override
  final int cardValue;

  CatchCardAttribute({required this.cardValue, required this.cardComparator});

  @override
  final CardComparator cardComparator;

  @override
  CardCompareResultType compare(CardAttribute other) {
    return compareWith<int>(
      other.cardValue,
      (otherValue) => cardValue > otherValue,
      (otherValue) => cardValue < otherValue,
    );
  }
}
