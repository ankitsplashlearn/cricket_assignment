import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/Enums/CardComparator.dart';

class CatchCardAttribute extends CardAttribute{
  @override
  int cardValue;

  @override
  String name;

  @override
  CardComparator cardComparator;

  CatchCardAttribute({required this.name, required this.cardValue, required this.cardComparator});
}