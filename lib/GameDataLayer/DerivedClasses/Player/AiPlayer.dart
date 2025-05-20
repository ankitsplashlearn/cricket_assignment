import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/GameCard.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/SpecialMode.dart';
import 'package:cricket_card/GameDataLayer/BaseClasses/PlayerHealth.dart';
import 'package:cricket_card/GameDataLayer/DerivedClasses/Card/CardAttribute/RunCardAttribute.dart';
import 'package:cricket_card/GameDataLayer/DerivedClasses/Card/CricketGameCard.dart';
import 'package:cricket_card/GameDataLayer/Enums/CardComparator.dart';

class AiPlayer extends Player {
  @override
  int id;

  @override
  String name;

  @override
  PlayerHealth playerHealth;

  @override
  List<SpecialMode> specialModes;

  AiPlayer({
    required this.id,
    required this.name,
    required this.playerHealth,
    required this.specialModes,
  });
}