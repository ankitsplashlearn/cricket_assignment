import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/UiLayer/Enums/GameModeEnum.dart';

class GameModeSelectionScreenController{
  GameModeEnum _gameModeEnum = GameModeEnum.playerVsPlayer;

  void setGameModeEnum(GameModeEnum gameMode){
    _gameModeEnum = gameMode;
  }

  GameModeEnum getGameModeEnum(){
    return _gameModeEnum;
  }
}