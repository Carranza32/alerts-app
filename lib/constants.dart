import 'package:flutter/material.dart';

TextStyle loginTitleStyle() => const TextStyle(
  fontSize: 26,
  fontWeight: FontWeight.w600,
  color: Colors.black,
);

InputDecoration authFormFieldStyle() => const InputDecoration(
	labelText: 'Email Address',
  hintText: 'Enter your email...',
  filled: true,
  fillColor: Color(0xfff4f4f4),
  prefixIconColor: Color.fromARGB(255, 164, 167, 170),
  border: OutlineInputBorder(
		borderRadius: BorderRadius.all(Radius.circular(50)),
	),

  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffe0e3e7), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(50)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0x00000000), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(50)),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromARGB(255, 239, 57, 57), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(50)),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromARGB(255, 239, 57, 57), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(50)),
  ),
  
);