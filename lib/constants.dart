import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);

const double defaultPadding = 16.0;

TextStyle loginTitleStyle() => const TextStyle(
  fontSize: 26,
  fontWeight: FontWeight.w600,
  color: Colors.black,
);

InputDecorationTheme authFormFieldTheme() => const InputDecorationTheme(
	filled: true,
	fillColor: kPrimaryLightColor,
	iconColor: kPrimaryColor,
	prefixIconColor: kPrimaryColor,
	contentPadding: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding),
	border: OutlineInputBorder(
		borderRadius: BorderRadius.all(Radius.circular(30)),
		borderSide: BorderSide.none,
	),
);

ElevatedButtonThemeData authButtonTheme() => ElevatedButtonThemeData(
	style: ElevatedButton.styleFrom(
		elevation: 0,
		backgroundColor: kPrimaryColor,
		shape: const StadiumBorder(),
		maximumSize: const Size(double.infinity, 56),
		minimumSize: const Size(double.infinity, 56),
	),
);

AppBarTheme appBarTheme() => const AppBarTheme(
  elevation: 4,
  centerTitle: true,
  iconTheme: IconThemeData(color: Colors.black),
  backgroundColor: Color(0xffebe5d9),
);