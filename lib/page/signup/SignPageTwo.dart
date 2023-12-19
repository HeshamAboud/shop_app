import "package:flutter/material.dart";
import "package:nice_ui/page/signup/widgets/date_picker.dart";
import "package:nice_ui/page/signup/widgets/gender_picker.dart";
import "package:nice_ui/page/signup/widgets/location_picker.dart";
import "package:nice_ui/page/signup/widgets/signup_apbar.dart";
import "package:nice_ui/page/signup/widgets/signup_button.dart";
import "package:nice_ui/page/signup/widgets/signup_profile_image_picker.dart";

import "../../const/gradient_const.dart";



class SignPageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SignupApbar(
        title: 'CREATE ACCOUNT',
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 64.0),
        decoration: const BoxDecoration(gradient: SIGNUP_BACKGROUND),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            Center(
              child: ProfileImagePicker(
                margin: const EdgeInsets.only(top: 32.0, left: 32.0, right: 32.0),
              ),
            ),
            DatePicker(),
            GenderPicker(),
            LocationPicker(),
            Container(
                margin: const EdgeInsets.only(top: 32.0),
                child: Center(child: signupButton('NEXT')))
          ],
        ),
      ),
    );
  }
}
