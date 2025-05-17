import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/Enums/CardComparator.dart';
import 'package:cricket_card/GameDataLayer/Enums/CardThrowResult.dart';

class RunCardAttribute extends CardAttribute {
  @override
  int cardValue;

  @override
  String name;

  @override
  CardComparator cardComparator;

  RunCardAttribute({
    required this.name,
    required this.cardValue,
    required this.cardComparator,
  });
}
