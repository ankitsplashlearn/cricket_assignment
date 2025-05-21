import 'dart:convert';

import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/DerivedClasses/Card/CardAttribute/CatchCardAttribute.dart';
import 'package:cricket_card/GameDataLayer/DerivedClasses/Card/CardAttribute/CenturyCardAttribute.dart';
import 'package:cricket_card/GameDataLayer/DerivedClasses/Card/CardAttribute/HalfCenturyCardAttribute.dart';
import 'package:cricket_card/GameDataLayer/DerivedClasses/Card/CardAttribute/MatchCardAttribute.dart';
import 'package:cricket_card/GameDataLayer/DerivedClasses/Card/CardAttribute/RunCardAttribute.dart';
import 'package:cricket_card/GameDataLayer/DerivedClasses/Card/CardAttribute/WicketCardAttribute.dart';
import 'package:cricket_card/GameDataLayer/DerivedClasses/Card/CricketGameCard.dart';
import 'package:cricket_card/GameDataLayer/Enums/AttributeEnum.dart';
import 'package:cricket_card/GameDataLayer/Enums/CardComparator.dart';
import 'package:flutter/services.dart';

class DeckUtil {
  static List<CricketGameCard> cricketGameCards = [];

  static Future<List<CricketGameCard>> getCricketCardsDeckFromJson() async {
    final String jsonString = await rootBundle.loadString(
      'assets/card_data/cricket_cards.json',
    );
    final List<dynamic> jsonList = json.decode(jsonString);

    cricketGameCards.clear();

    for (var jsonCard in jsonList) {
      final String name = jsonCard['name'];
      final List<CardAttribute> attributes = [];
      final int id = jsonCard['id'] ?? 0;
      final List<dynamic> rawAttributes = jsonCard['attributes'];
      
      for (var attr in rawAttributes) {
        final String type = attr['type'] ?? "Runs";
        final dynamic value = attr['value'] ?? "0";
        final CardComparator cardComparator =
            CardComparator.fromInt(attr['comparator'] ?? 0);
        final CardAttribute attribute =
            _createAttribute(type, value, cardComparator);
        attributes.add(attribute);
      }
      cricketGameCards.add(CricketGameCard(id: id, name: name, attributes: attributes));
    }

    return cricketGameCards;
  }

  static CricketGameCard? findCardWithHighestAttribute<T extends CardAttribute>(
      AttributeEnum attributeEnum
      ) {
    CricketGameCard? highestCard;
    T? highestAttribute;

    for (var card in cricketGameCards) {
      var attr = card.attributes[attributeEnum.stringValue()];
      if (attr is T) {
        if (highestAttribute == null || attr.cardValue > highestAttribute.cardValue) {
          highestAttribute = attr;
          highestCard = card;
        }
      }
    }

    return highestCard;
  }

  static CardAttribute _createAttribute(
      String type, dynamic value, CardComparator cardComparator) {

    AttributeEnum attributeEnum = AttributeEnum.fromString(type);
    switch (attributeEnum) {
      case AttributeEnum.runs:
        return RunCardAttribute(
            cardValue: value, cardComparator: cardComparator);
      case AttributeEnum.matches:
        return MatchCardAttribute(
            cardValue: value, cardComparator: cardComparator);
      case AttributeEnum.centuries:
        return CenturyCardAttribute(
            cardValue: value, cardComparator: cardComparator);
      case AttributeEnum.halfCenturies:
        return HalfCenturyCardAttribute(
            cardValue: value, cardComparator: cardComparator);
      case AttributeEnum.catches:
        return CatchCardAttribute(
            cardValue: value, cardComparator: cardComparator);
      case AttributeEnum.wickets:
        return WicketCardAttribute(
            cardValue: value, cardComparator: cardComparator);
      }
  }
}
