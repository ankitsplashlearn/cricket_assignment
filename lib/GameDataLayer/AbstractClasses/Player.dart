import 'package:cricket_card/GameDataLayer/AbstractClasses/SpecialMode.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/GameCard.dart';
import 'package:cricket_card/GameDataLayer/BaseClasses/PlayerHealth.dart';
import 'package:cricket_card/GameDataLayer/Mixins/PlayerCardAction.dart';
import 'package:cricket_card/GameDataLayer/Mixins/PlayerIdCounter.dart';

abstract class Player with PlayerCardAction, PlayerIdCounter {
  late int id;
  String name;
  PlayerHealth playerHealth;
  SpecialMode specialMode;
  List<GameCard> availableCards;

  Player({
    required this.name,
    required this.playerHealth,
    required this.specialMode,
    required this.availableCards,
  }) {
    id = nextCount;
  }
}
