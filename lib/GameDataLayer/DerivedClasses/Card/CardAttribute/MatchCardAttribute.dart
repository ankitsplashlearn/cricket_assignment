import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/Enums/CardComparator.dart';
import 'package:cricket_card/helper/helper_functions.dart';

class MatchCardAttribute extends CardAttribute {
  @override
  int cardValue;

  @override
  String get name => 'Matches';

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

  MatchCardAttribute({required this.cardValue, required this.cardComparator});
}
