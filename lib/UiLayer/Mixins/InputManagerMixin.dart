import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/SpecialMode.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/GameCard.dart';

mixin InputManagerMixin{
  void selectCardForCurrentPlayer(Player player, GameCard gameCard);
  void selectCardParameterForCurrentPlayer(Player player, GameCard gameCard);
  void enableSpecialModeForCurrentPlayer(Player player, SpecialMode specialMode);
  void applyCurrentPlayerThrow();
}