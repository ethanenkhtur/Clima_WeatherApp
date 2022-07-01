import 'package:flutter/material.dart';

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextFieldInputDecoration = InputDecoration(
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter city name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: UnderlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
