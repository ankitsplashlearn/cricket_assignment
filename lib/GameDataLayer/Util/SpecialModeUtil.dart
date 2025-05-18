import 'package:cricket_card/GameDataLayer/AbstractClasses/SpecialMode.dart';
import 'package:cricket_card/GameDataLayer/DerivedClasses/SpecialMode/FreeHitMode.dart';
import 'package:cricket_card/GameDataLayer/DerivedClasses/SpecialMode/PowerPlayMode.dart';
import 'package:cricket_card/GameDataLayer/DerivedClasses/SpecialMode/SuperMode.dart';
import 'package:cricket_card/GameDataLayer/DerivedClasses/SpecialMode/WorldCupMode.dart';

class SpecialModeUtil{
  static List<SpecialMode> getAvailableSpecialModes(){
    List<SpecialMode> specialModes = [];

    specialModes.add(FreeHitMode());
    specialModes.add(PowerPlayMode());
    specialModes.add(SuperMode());
    specialModes.add(WorldCupMode());

    return specialModes;
  }
}