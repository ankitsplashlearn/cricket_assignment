import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/GameCard.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';

class HumanPlayer extends Player{
  HumanPlayer({required super.name, required super.playerHealth, required super.specialMode, required super.availableCards});

  @override
  GameCard getSelectedCard() {
    // TODO: implement getSelectedCard
    throw UnimplementedError();
  }

  @override
  CardAttribute getSelectedCardAttribute() {
    // TODO: implement getSelectedCardAttribute
    throw UnimplementedError();
  }

}