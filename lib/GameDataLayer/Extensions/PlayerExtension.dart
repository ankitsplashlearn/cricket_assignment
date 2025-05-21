import 'package:cricket_card/GameDataLayer/AbstractClasses/GameCard.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/Player.dart';
import 'package:cricket_card/GameDataLayer/DerivedClasses/Card/CardAttribute/RunCardAttribute.dart';
import 'package:cricket_card/GameDataLayer/DerivedClasses/Card/CricketGameCard.dart';
import 'package:cricket_card/GameDataLayer/Enums/AttributeEnum.dart';
import 'package:cricket_card/GameDataLayer/Util/DeckUtil.dart';

extension PlayerExtension on Player{
  bool hasHighestRunsCard(){
    bool result = false;
    CricketGameCard? cricketGameCard = DeckUtil.findCardWithHighestAttribute<RunCardAttribute>(AttributeEnum.runs);
    if(cricketGameCard != null){
      if(availableCards.contains(cricketGameCard)){
        result = true;
      }
    }

    return result;
  }

  bool hasHighestWicketsCard(){
    bool result = false;
    CricketGameCard? cricketGameCard = DeckUtil.findCardWithHighestAttribute<RunCardAttribute>(AttributeEnum.wickets);
    if(cricketGameCard != null){
      if(availableCards.contains(cricketGameCard)){
        result = true;
      }
    }

    return result;
  }
}