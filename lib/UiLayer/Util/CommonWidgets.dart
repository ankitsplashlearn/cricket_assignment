import 'package:cricket_card/UiLayer/Util/TextStyleUtil.dart';
import 'package:flutter/material.dart';

Widget gameModeSelectionCard(String cardTitle, Function callback) {
  return GestureDetector(
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 48, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white, width: 4),
      ),
      child: Center(
        child: Text(
          cardTitle,
          style: TextStyleUtil.whiteTextStyle(fontSize: 32, bold: true),
        ),
      ),
    ),
    onTap: (){
      callback();
    },
  );
}
