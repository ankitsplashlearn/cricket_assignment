import 'dart:convert';

import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/DerivedClasses/Card/CardAttribute/CatchCardAttribute.dart';
import 'package:cricket_card/GameDataLayer/DerivedClasses/Card/CardAttribute/CenturyCardAttribute.dart';
import 'package:cricket_card/GameDataLayer/DerivedClasses/Card/CardAttribute/HalfCenturyCardAttribute.dart';
import 'package:cricket_card/GameDataLayer/DerivedClasses/Card/CardAttribute/MatchCardAttribute.dart';
import 'package:cricket_card/GameDataLayer/DerivedClasses/Card/CardAttribute/RunCardAttribute.dart';
import 'package:cricket_card/GameDataLayer/DerivedClasses/Card/CardAttribute/WicketCardAttribute.dart';
import 'package:cricket_card/GameDataLayer/DerivedClasses/Card/CricketGameCard.dart';
import 'package:cricket_card/GameDataLayer/Enums/CardComparator.dart';
import 'package:flutter/services.dart';

class DeckUtil {
  static Future<List<CricketGameCard>> getDeckFromJson() async {
    final String jsonString = await rootBundle.loadString(
      'assets/card_data/cricket_cards.json',
    );
    final List<dynamic> jsonList = json.decode(jsonString);

    final List<CricketGameCard> deck = [];

    for (var jsonCard in jsonList) {
      final String name = jsonCard['name'];
      final List<CardAttribute> attributes = [];

      final List<dynamic> rawAttributes = jsonCard['attributes'];
      for (var attr in rawAttributes) {
        final String type = attr['type'] ?? "Runs";
        final dynamic value = attr['value'] ?? "0";
        final CardComparator cardComparator = CardComparator.fromInt(attr['comparator'] ?? 0);
        final CardAttribute attribute = _createAttribute(type, value, cardComparator);
        attributes.add(attribute);
      }

      deck.add(CricketGameCard(name: name, attributes: attributes));
    }

    return deck;
  }

  static CardAttribute _createAttribute(String type, dynamic value, CardComparator cardComparator) {
    switch (type) {
      case "Runs":
        return RunCardAttribute(name: type, cardValue: value, cardComparator: cardComparator);
      case "Matches":
        return MatchCardAttribute(name: type, cardValue: value, cardComparator: cardComparator);
      case "Centuries":
        return CenturyCardAttribute(name: type, cardValue: value, cardComparator: cardComparator);
      case "Half Centuries":
        return HalfCenturyCardAttribute(name: type, cardValue: value, cardComparator: cardComparator);
      case "Catches":
        return CatchCardAttribute(name: type, cardValue: value, cardComparator: cardComparator);
      case "Wickets":
        return WicketCardAttribute(name: type, cardValue: value, cardComparator: cardComparator);
      default:
        throw Exception("Unknown attribute type: $type");
    }
  }
}
