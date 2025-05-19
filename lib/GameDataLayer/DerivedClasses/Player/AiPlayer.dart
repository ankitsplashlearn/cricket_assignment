import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/GameCard.dart';
import 'package:cricket_card/GameDataLayer/BaseClasses/PlayerHealth.dart';
import 'package:cricket_card/GameDataLayer/DerivedClasses/Card/CardAttribute/RunCardAttribute.dart';
import 'package:cricket_card/GameDataLayer/DerivedClasses/Card/CricketGameCard.dart';
import 'package:cricket_card/GameDataLayer/Enums/CardComparator.dart';

class AiPlayer extends Player {

  @override
  PlayerHealth get playerHealth => _playerHealth;
  
  late PlayerHealth _playerHealth;

  AiPlayer({
    required super.name,
    required super.specialMode,
  }) {
    _playerHealth = PlayerHealth(
      maxHealth: 150,
    );
  }

  void selectCard(){

  }

  void selectCardAttribute(){

  }
}


class AiHead