import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/GameCard.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/GameDataLayer/Mixins/GameRoundsHandler.dart';

class GameManager with GameRoundsHandler{
  List<Player> players;

  GameManager({required this.players});

  @override
  void enableSpecialModeForCurrentPlayer() {
    // TODO: implement activateSpecialModeForCurrentPlayer
  }

  @override
  void applyCurrentPlayerThrow() {
    // TODO: implement applyCurrentPlayerThrow
  }

  @override
  void selectCardAttributeForCurrentPlayer(CardAttribute cardAttribute) {
    // TODO: implement selectCardAttributeForCurrentPlayer
  }

  @override
  void selectCardForCurrentPlayer(GameCard gameCard) {
    // TODO: implement selectCardForCurrentPlayer
  }

  @override
  void disableSpecialModeForCurrentPlayer() {
    // TODO: implement disableSpecialModeForCurrentPlayer
  }
}
