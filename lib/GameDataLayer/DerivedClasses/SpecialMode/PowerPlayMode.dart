import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/SpecialMode.dart';
import 'package:cricket_card/GameDataLayer/Enums/CardThrowResult.dart';

class PowerPlayMode extends SpecialMode {
  @override
  int get attributesCountAllowedToSelect => 2;
  @override
  bool applyModeEffect(Player player, Player otherPlayer,
      bool isHealthReducedForCurrentPlayer) {

    var gameRoundResult = cardThrowResult(player, otherPlayer);
    switch (gameRoundResult) {
      case CardThrowResult.win:
        otherPlayer.playerHealth.reduceHealth(reduceBy: 25);
      case CardThrowResult.loss:
        if(!isHealthReducedForCurrentPlayer){
          player.playerHealth.reduceHealth(reduceBy: 10);
          isHealthReducedForCurrentPlayer = true;
        }
        return true;
      default:
        break;
    }

    return false;
  }

  @override
  String get modeName => "Power Play Mode";
}
