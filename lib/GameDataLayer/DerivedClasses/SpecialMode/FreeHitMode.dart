import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/SpecialMode.dart';
import 'package:cricket_card/GameDataLayer/Enums/CardThrowResult.dart';

class FreeHitMode extends SpecialMode {
  @override
  String get modeName => "Free Hit Mode";

  @override
  bool applyModeEffect(Player player, Player otherPlayer,
      bool isHealthReducedForCurrentPlayer) {

    var gameRoundResult = cardThrowResult(player, otherPlayer);
    switch (gameRoundResult) {
      case CardThrowResult.win:
        otherPlayer.playerHealth.reduceHealth(reduceBy: 12.5);
      case CardThrowResult.loss:
        player.playerHealth.reduceHealth(reduceBy: 15);
        return true;
      default:
        break;
    }

    return false;
  }
}
