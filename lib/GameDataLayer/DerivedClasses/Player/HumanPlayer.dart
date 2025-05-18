import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/GameCard.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';

class HumanPlayer extends Player {
  HumanPlayer({
    required super.name,
    required super.playerHealth,
    required super.specialMode,
  });
}
