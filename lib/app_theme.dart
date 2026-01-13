import 'package:flutter/material.dart';


const Color kPrimaryColor = Color(0xff3d405b);
const Color kSecondaryColor = Color(0xffe07a5f);

const Color kLightText = Colors.white;
const Color kDarkText = Colors.black;


TextStyle kHeaderDarkTextStyle = TextStyle(
  fontSize: 36,
  fontWeight: FontWeight.bold,
  color: kDarkText
);

TextStyle kHeaderLightTextStyle = TextStyle(
  fontSize: 36,
  fontWeight: FontWeight.bold,
  color: kLightText
);

TextStyle kTitleDarkTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
  color: kDarkText
);

TextStyle kTitleLightTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
  color: kLightText
);

ElevatedButton kPrimaryButton (
String text,
Function() fn
){
  return  ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    side: BorderSide(
                    ),
                    shape: RoundedSuperellipseBorder(
                      borderRadius: BorderRadius.circular(5)
                    ),
                  ),
                onPressed: fn, 
                child: Text(text,
                style: kTitleLightTextStyle,));
}
