import 'package:cricket_card/GameDataLayer/AbstractClasses/CardAttribute.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/GameCard.dart';
import 'package:cricket_card/GameDataLayer/AbstractClasses/SpecialMode.dart';
import 'package:cricket_card/UiLayer/Util/TextStyleUtil.dart';
import 'package:flutter/material.dart';

Widget gameModeSelectionCard(String cardTitle, Function callback) {
  return GestureDetector(
    child: Container(
      height: 200,
      padding: EdgeInsets.symmetric(vertical: 48, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white, width: 4),
      ),
      child: Center(
        child: Text(
          cardTitle,
          style: TextStyleUtil.whiteTextStyle(fontSize: 32, bold: true),
        ),
      ),
    ),
    onTap: () {
      callback();
    },
  );
}

Widget buildPlayerForm(
  String title,
  TextEditingController controller,
  Function(SpecialMode?) onModeSelected,
  List<SpecialMode> availableModes,
  SpecialMode? selectedMode,
) {
  return Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(color: Colors.grey.shade900),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Colors.white, fontSize: 18)),
        Container(
          padding: EdgeInsets.all(8),
          width: 200,
          height: 100,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: "Name",
              labelStyle: TextStyle(color: Colors.white),
              filled: true,
              fillColor: Colors.grey.shade800,
              border: OutlineInputBorder(),
            ),
            style: TextStyle(color: Colors.white),
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          width: 200,
          height: 100,
          child: DropdownButtonFormField<SpecialMode>(
            value: selectedMode,
            items:
                availableModes.map((mode) {
                  return DropdownMenuItem<SpecialMode>(
                    value: mode,
                    child: Text(mode.modeName),
                  );
                }).toList(),
            onChanged: onModeSelected,
            decoration: InputDecoration(
              labelText: "Special Mode",
              labelStyle: TextStyleUtil.whiteTextStyle(fontSize: 14),
              filled: true,
              fillColor: Colors.grey.shade800,
              border: OutlineInputBorder(),
            ),
            dropdownColor: Colors.grey.shade900,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );
}

List<Widget> gameCardsWidget({
  required List<GameCard> gameCards,
  required Function(GameCard) cardTapCallback,
}) {
  List<Widget> gameCardWidgets = [];

  for (var gameCard in gameCards) {
    gameCardWidgets.add(
      _buttonEnabledWidget(
        child: gameCardWidget(
          gameCard: gameCard,
          attributeTapCallback: (cardAttribute) {},
        ),
        callback: () {
          cardTapCallback(gameCard);
        },
      ),
    );
  }

  return gameCardWidgets;
}

Widget gameCardWidget({
  required GameCard? gameCard,
  required Function(CardAttribute) attributeTapCallback,
  List<CardAttribute>? selectedCardAttributes,
  bool attributeTapActive = false,
}) {
  List<CardAttribute> attributes = selectedCardAttributes ?? [];

  List<Widget> cardAttributeWidgets = [];

  if(gameCard == null){
    return Container();
  }
  cardAttributeWidgets.add(keyValueRichText("Name", gameCard.name));

  for (var entry in gameCard.attributes.entries) {
    CardAttribute attribute = entry.value;

    if(attributes.contains(attribute)){
      continue;
    }

    Widget cardAttributeWidget = keyValueRichText(
      attribute.name,
      attribute.cardValue.toString(),
    );

    if (attributeTapActive) {
      cardAttributeWidget = _buttonEnabledWidget(
        child: cardAttributeWidget,
        callback: () {
          attributeTapCallback(attribute);
        },
      );
    }

    cardAttributeWidgets.add(cardAttributeWidget);
  }

  return Container(
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.blueGrey,
      border: Border.all(color: Colors.yellowAccent),
    ),
    child: Column(children: cardAttributeWidgets),
  );
}

Widget keyValueRichText(String title, String value) {
  return RichText(
    text: TextSpan(
      text: "$title : ",
      children: [
        TextSpan(
          text: value,
          style: TextStyleUtil.yellowTextStyle(fontSize: 16, bold: true),
        ),
      ],
      style: TextStyleUtil.whiteTextStyle(fontSize: 16),
    ),
  );
}

Widget _buttonEnabledWidget({
  required Widget child,
  required Function callback,
}) {
  return TextButton(
    onPressed: () {
      callback();
    },
    child: child,
  );
}
