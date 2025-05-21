import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/SpecialMode.dart';
import 'package:cricket_card/GameDataLayer/Enums/CardThrowResult.dart';
import 'package:cricket_card/GameDataLayer/Extensions/PlayerExtension.dart';
import 'package:cricket_card/GameDataLayer/Util/DeckUtil.dart';

class SuperMode extends SpecialMode {
  @override
  int get attributesCountAllowedToSelect => 1;
  @override
  int get cardAttributedAvailableToSelect => 2;

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
  String get modeName => "Super Mode";

  @override
  bool canBeUsed(Player player) {
    if(player.hasHighestRunsCard() && player.hasHighestWicketsCard()){
      return super.canBeUsed(player);
    }else{
      return false;
    }
  }
}
