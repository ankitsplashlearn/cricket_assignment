import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/GameCard.dart';

class AiPlayer extends Player{
  AiPlayer({required super.name, required super.playerHealth, required super.specialMode, required super.availableCards});

  @override
  GameCard getSelectedCard() {
    // TODO: implement selectCard
    throw UnimplementedError();
  }

  @override
  CardAttribute getSelectedCardAttribute() {
    // TODO: implement selectCardAttribute
    throw UnimplementedError();
  }

}