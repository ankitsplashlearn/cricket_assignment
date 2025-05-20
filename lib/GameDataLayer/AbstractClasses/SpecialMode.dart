import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/GameDataLayer/Enums/CardThrowResult.dart';

abstract class SpecialMode {
  String get modeName;

  bool _isUsed = false;
  bool _isActiveNow = false;

  int get cardAttributedAvailableToSelect => 1;

  bool canBeUsed(Player player) {
    return !_isUsed;
  }

  bool get isActiveNow => _isActiveNow;

  void activate() {
    if (!_isUsed) {
      _isActiveNow = true;
    }
  }

  void deActivate() {
    _isActiveNow = false;
  }

  void setUsed() {
    _isUsed = true;
    _isActiveNow = false;
  }

  CardThrowResult cardThrowResult(Player currentPlayer, Player otherPlayer) {
    //Current player cards will be prioritized to win
    CardThrowResult result = CardThrowResult.draw;

    //returning draw if any of the list is empty
    if(otherPlayer.selectedCardAttributes.isEmpty || currentPlayer.selectedCardAttributes.isEmpty){
      return result;
    }

    //if any possibility exist to win then check
    for (var attribute in currentPlayer.selectedCardAttributes) {
      result = attribute.compareAttributes(otherPlayer.selectedCardAttributes.first);
      if(result == CardThrowResult.win){
        result = CardThrowResult.win;
        break;
      }
    }

    return result;
  }

  //returns true if the current lost and false current player wins
  //this flag will be used further to check if the current players'
  //health needs to be reduced or not
  bool applyModeEffect(Player player, Player otherPlayer,
      bool isHealthReducedForCurrentPlayer);
}
