import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/SpecialMode.dart';
import 'package:cricket_card/GameDataLayer/Enums/CardThrowResult.dart';

class SuperMode extends SpecialMode {
  @override
  int get cardAttributedAvailableToSelect => 2;

  @override
  bool applyModeEffect(Player player, Player otherPlayer,
      bool isHealthReducedForCurrentPlayer) {

    var gameRoundResult = cardThrowResult(player, otherPlayer);
    switch (gameRoundResult) {
      case CardThrowResult.win:
        otherPlayer.playerHealth.reduceHealth(reduceBy: 10);
      case CardThrowResult.loss:
        player.playerHealth.reduceHealth(reduceBy: 10);
        return true;
      default:
        break;
    }

    return false;
  }

  @override
  String get modeName => "Super Mode";
}
