import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/SpecialMode.dart';
import 'package:cricket_card/GameDataLayer/Enums/CardThrowResult.dart';

//This mode will be used for non-special mode throws
class DefaultMode extends SpecialMode {
  @override
  int get attributesCountAllowedToSelect => 1;
  @override
  String get modeName => "Default Mode";

  @override
  bool applyModeEffect(Player player, Player otherPlayer,
      bool isHealthReducedForCurrentPlayer) {

    var gameRoundResult = cardThrowResult(player, otherPlayer);
    switch (gameRoundResult) {
      case CardThrowResult.win:
        otherPlayer.playerHealth.reduceHealth(reduceBy: 10);
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
}