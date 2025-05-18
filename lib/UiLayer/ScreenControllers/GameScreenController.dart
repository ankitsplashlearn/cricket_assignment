import 'package:cricket_card/GameDataLayer/BaseClasses/GameManager.dart';
import 'package:cricket_card/UiLayer/Enums/GameModeEnum.dart';
import 'package:cricket_card/ViewModelLayer/InputManager.dart';

class GameScreenController{
  final GameModeEnum gameModeEnum;

  late final InputManager inputManager;
  late final GameManager gameManager;

  GameScreenController({required this.gameModeEnum}){

  }
}