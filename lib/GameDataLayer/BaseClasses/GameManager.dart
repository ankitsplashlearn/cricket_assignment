import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/GameDataLayer/Mixins/GameRoundsHandler.dart';

class GameManager with GameRoundsHandler{
  List<Player> players;

  GameManager({required this.players});

  @override
  void activateSpecialModeForCurrentPlayer(Player player) {
    // TODO: implement activateSpecialModeForCurrentPlayer
  }

  @override
  void applyCurrentPlayerThrow(Player player) {
    // TODO: implement applyCurrentPlayerThrow
  }

  @override
  void selectCardAttributeForCurrentPlayer(Player player) {
    // TODO: implement selectCardAttributeForCurrentPlayer
  }

  @override
  void selectCardForCurrentPlayer(Player player) {
    // TODO: implement selectCardForCurrentPlayer
  }
}
