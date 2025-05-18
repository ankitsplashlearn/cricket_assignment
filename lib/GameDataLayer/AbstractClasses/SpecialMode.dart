import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';

abstract class SpecialMode {
  final String modeName;
  final double damageToReceive;
  final double damageToApply;

  bool _isUsed = false;
  bool _isActiveNow = false;

  SpecialMode({required this.modeName, required this.damageToReceive, required this.damageToApply}) {}

  bool canBeUsed(Player player){
    return !_isUsed;
  }

  bool get isActiveNow => _isActiveNow;

  void activate(){
    if(!_isUsed){
      _isActiveNow = true;
    }
  }

  void deActivate(){
    _isActiveNow = false;
  }

  void setUsed(){
    _isUsed = true;
  }
}
