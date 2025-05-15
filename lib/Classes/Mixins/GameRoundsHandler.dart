import 'package:cricket_card/Classes/AbstractClasses/Player.dart';
import 'package:cricket_card/Classes/AbstractClasses/SpecialMode.dart';

mixin GameRoundsHandler{
  void selectCardForCurrentPlayer(Player player);
  void selectCardAttributeForCurrentPlayer(Player player);
  void activateSpecialModeForCurrentPlayer(Player player);
  void applyCurrentPlayerThrow(Player player);
}