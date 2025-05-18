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
