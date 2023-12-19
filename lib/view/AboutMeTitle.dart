
import "package:flutter/material.dart";

import "../const/color_const.dart";
import "../const/images_const.dart";
import "../const/string_const.dart";


class AboutMeTitle extends AboutListTile {
  AboutMeTitle({super.key})
      : super(
            icon: Image.asset(
              MainImagePath.image_app,
              width: 40.0,
              height: 40.0,
            ),
            applicationName: StringConst.APP_NAME,
            applicationVersion: "1.0",
            applicationLegalese: "MIT License 2.0",
            aboutBoxChildren: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
                child: Text(
                  StringConst.CREATE_BY,
                  style: TextStyle(color: TEXT_BLACK_LIGHT),
                ),
              )
            ]);
}
