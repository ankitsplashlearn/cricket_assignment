import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/Enums/CardComparator.dart';
import 'package:cricket_card/helper/helper_functions.dart';

class BolwingRateProperty extends CardAttribute {
  @override
  String get name => 'BowlingRate';

  @override
  final double cardValue;

  BolwingRateProperty({required this.cardValue, required this.cardComparator});

  @override
  final CardComparator cardComparator;

  @override
  CardCompareResultType compare(CardAttribute other) {
    return compareWith<double>(
      other.cardValue,
      (otherValue) => cardValue > otherValue,
      (otherValue) => cardValue < otherValue,
    );
  }
}
