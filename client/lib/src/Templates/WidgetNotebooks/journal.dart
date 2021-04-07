import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';

journal(color) {
  return Material(
    child: Ink(
      child: InkWell(
        onTap: () { },
        child: ClipPath(
          clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
            )
          ),
          child: Container(
            height: 200, width: 130,
            decoration: BoxDecoration(
              color: Color(int.parse('0xff' + color)),
              border: Border(
                left: BorderSide(
                  color: TinyColor.fromString(color).darken(10).color,
                  width: 25.0
                )
              )
            )
          )
        ),
      ),
    )
  );
}
