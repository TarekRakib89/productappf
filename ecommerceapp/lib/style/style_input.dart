import 'package:flutter/material.dart';

InputDecoration applyInputDecoration({String? text, IconData? iconData}) {
  return InputDecoration(
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
    ),
    filled: true,
    fillColor: Colors.white,
    prefixIcon: iconData != null
        ? Icon(
            iconData,
            size: 30,
            color: Colors.black87,
          )
        : null,
    hintText: text ?? '',
    hintStyle: const TextStyle(
      color: Colors.black,
    ),
    contentPadding: const EdgeInsets.only(top: 10),
  );
}

ButtonStyle applyButtonStyle() {
  return ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
    backgroundColor: Colors.grey,
  );
}
