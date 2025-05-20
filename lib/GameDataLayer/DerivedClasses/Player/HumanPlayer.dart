import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/GameCard.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/SpecialMode.dart';
import 'package:cricket_card/GameDataLayer/BaseClasses/PlayerHealth.dart';

class HumanPlayer extends Player {

  @override
  int id;

  @override
  String name;

  @override
  PlayerHealth playerHealth;

  @override
  List<SpecialMode> specialModes;

  HumanPlayer({
    required this.id,
    required this.name,
    required this.playerHealth,
    required this.specialModes,
  });
}
