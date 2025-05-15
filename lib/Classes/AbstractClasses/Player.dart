import 'package:cricket_card/Classes/AbstractClasses/SpecialMode.dart';
import 'package:cricket_card/Classes/BaseClasses/BaseCard.dart';
import 'package:cricket_card/Classes/BaseClasses/PlayerHealth.dart';
import 'package:cricket_card/Classes/Mixins/PlayerCardAction.dart';
import 'package:cricket_card/Classes/Mixins/PlayerIdCounter.dart';

abstract class Player with PlayerCardAction, PlayerIdCounter {
  late int id;
  String name;
  PlayerHealth playerHealth;
  SpecialMode specialMode;
  List<BaseCard> availableCards;

  Player({
    required this.name,
    required this.playerHealth,
    required this.specialMode,
    required this.availableCards,
  }) {
    id = nextCount;
  }
}
