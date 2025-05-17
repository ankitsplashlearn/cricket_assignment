import 'package:cricket_card/GameDataLayer/BaseClasses/GameManager.dart';
import 'package:cricket_card/UiLayer/Mixins/InputManagerMixin.dart';

abstract class InputManager with InputManagerMixin{
  GameManager gameManager;

  InputManager({required this.gameManager});
}