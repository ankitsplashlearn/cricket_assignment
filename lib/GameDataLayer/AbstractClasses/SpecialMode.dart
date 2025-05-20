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

  void applyModeEffect(
      Player player, Player otherPlayer, CardThrowResult gameRoundResult);
}
