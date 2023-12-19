import 'package:flutter/material.dart';

import 'package:nice_ui/page/signup/widgets/signup_6_box.dart';
import 'package:nice_ui/page/signup/widgets/signup_arrow_button.dart';
import 'package:nice_ui/page/signup/widgets/signup_const.dart';

import '../../const/gradient_const.dart';
import '../../const/icons.dart';
import '../../const/images_const.dart';

class SignPageEight extends StatefulWidget {
  @override
  _SignPageEightState createState() => _SignPageEightState();
}

class _SignPageEightState extends State<SignPageEight> {
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    List<Widget> stackChildren = [
      buildBackgroundImage(),
      SignupSixBox(
        boxHeight: _media.height,
        boxWidth: _media.width,
        boxPadding: _media.width / 2 - 20,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 28.0, horizontal: 30),
          child: Text(
            "GOOGLE PLUS",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
        boxGradient: SIGNUP_SIX_GOOGLEP_BG,
      ),
      SignupSixBox(
        boxHeight: _media.height / 2.5,
        boxWidth: _media.width,
        boxPadding: _media.width / 2 - 80,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 28.0, horizontal: 30),
          child: Text(
            "TWITTER",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
        boxGradient: SIGNUP_SIX_TWITTER_BG,
      ),
      SignupSixBox(
        boxHeight: _media.height / 3.4,
        boxWidth: _media.width,
        boxPadding: _media.width / 2 - 140,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 28.0, horizontal: 30),
          child: Text(
            "FACEBOOK",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
        boxGradient: SIGNUP_SIX_FACEBOOK_BG,
      ),
      mainLoginStack(),
    ];

    return Scaffold(
      body: Stack(
        children: stackChildren,
      ),
    );
  }

  Container buildBackgroundImage() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(SignUpImagePath.SignUpPage_8_Bg),
          fit: BoxFit.contain,
          alignment: Alignment.bottomRight,
        ),
      ),
    );
  }

  Stack mainLoginStack() {
    final _media = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
          height: _media.height / 1.45,
          width: _media.width,
          decoration: const BoxDecoration(
            gradient: SIGNUP_BACKGROUND,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 15,
                spreadRadius: 8,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.asset(
                  SignUpImagePath.SignUpLogo,
                  height: _media.height / 6,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 30.0, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            "Log In",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            height: 100,
                            width: MediaQuery.of(context).size.width / 2 - 20,
                            child: const Text(
                              "Lorem ntempor quam, et lania sapien dolorsamet",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              softWrap: true,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: SignUpArrowButton(
                              height: 55,
                              width: 55,
                              icon: const IconData(arrow_right, fontFamily: 'Icons'),
                              iconSize: 10, onTap: (){},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 20.0, right: 15),
                      width: MediaQuery.of(context).size.width / 2,
                      height: _media.height / 2 - 44,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: FractionalOffset.topRight,
                          end: FractionalOffset.bottomRight,
// Add one stop for each color. Stops should increase from 0 to 1
                          stops: [0.3, 1],
                          colors: [
                            Colors.transparent,
                            Colors.black12,
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            height: 100,
                            width: MediaQuery.of(context).size.width / 2 - 20,
                            child: const Text(
                              "Lorem ipsum dolor sit amet, consectador.",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: SignUpArrowButton(
                              height: 55,
                              width: 55,
                              icon: IconData(arrow_right, fontFamily: 'Icons'),
                              iconSize: 10, onTap: (){},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
