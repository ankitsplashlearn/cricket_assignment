import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/SpecialMode.dart';
import 'package:cricket_card/GameDataLayer/Enums/CardThrowResult.dart';

class WorldCupMode extends SpecialMode {
  @override
  bool canBeUsed(Player player) {
    if (super.canBeUsed(player)) {
      return player.availableCards.length == 1;
    } else {
      return false;
    }
  }

  @override
  void applyModeEffect(
      Player player, Player otherPlayer, CardThrowResult gameRoundResult) {
    switch (gameRoundResult) {
      case CardThrowResult.win:
        otherPlayer.playerHealth.reduceHealth(reduceBy: 20);
      case CardThrowResult.loss:
        player.playerHealth.reduceHealth(reduceBy: 10);
      default:
        break;
    }
  }

  @override
  String get modeName => "World Cup Mode";
}
