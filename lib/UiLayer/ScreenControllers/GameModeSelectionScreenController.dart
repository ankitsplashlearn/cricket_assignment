import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/GameDataLayer/BaseClasses/GameManager.dart';
import 'package:cricket_card/UiLayer/Enums/GameModeEnum.dart';
import 'package:cricket_card/ViewModelLayer/InputManager.dart';

class GameModeSelectionScreenController{
  GameModeEnum _gameModeEnum = GameModeEnum.playerVsPlayer;

  void setGameModeEnum(GameModeEnum gameMode){
    _gameModeEnum = gameMode;
  }

  GameModeEnum getGameModeEnum(){
    return _gameModeEnum;
  }

  InputManager prepareInputManager(List<Player> players){
    GameManager gameManager = GameManager(players: players);
    InputManager inputManager = InputManager(gameManager: gameManager);

    return inputManager;
  }
}