import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/Enums/CardComparator.dart';
import 'package:cricket_card/helper/helper_functions.dart';

class DateOfBirthAttribute extends CardAttribute {
  @override
  String get name => 'Date of Birth';

  @override
  DateTime cardValue;

  DateOfBirthAttribute({required this.cardValue, required this.cardComparator});

  @override
  final CardComparator cardComparator;

  @override
  CardCompareResultType compare(CardAttribute other) {
    return compareWith<DateTime>(
      other.cardValue,
      (otherValue) => cardValue.isAfter(otherValue),
      (otherValue) => cardValue.isBefore(otherValue),
    );
  }
}
