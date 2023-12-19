import 'package:flutter/material.dart';
import 'package:nice_ui/page/signup/widgets/signup_apbar.dart';
import 'package:nice_ui/page/signup/widgets/signup_arrow_button.dart';

import '../../const/gradient_const.dart';
import '../../const/icons.dart';

class SignPageFive extends StatefulWidget {
  @override
  _SignPageFiveState createState() => _SignPageFiveState();
}

class _SignPageFiveState extends State<SignPageFive> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  int widgetIndex = 0;
  PageController? _pageController;
  bool _isSelected = false;

  _selectType(bool isSelected) {
    setState(() {
      _isSelected = isSelected;
    });
  }

  @override
  void initState() {
    _pageController = PageController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      loginColumn(),
      sigNupColumn(),
    ];

    return Scaffold(
      appBar: SignupApbar(
        title: "LOGIN",
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: SIGNUP_BACKGROUND,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(
                            top: 80,
                            left: 70,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      _selectType(false);
                                      _pageController!.previousPage(
                                        duration: const Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                      );
                                    },
                                    child: Opacity(
                                      opacity: _isSelected ? 0.5 : 1,
                                      child: const Text(
                                        "LOGIN",
                                        style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.5,
                                          wordSpacing: 1.5,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _pageController!.nextPage(
                                        duration: const Duration(milliseconds: 300),
                                        curve: Curves.easeOut,
                                      );
                                      _selectType(true);
                                    },
                                    child: Opacity(
                                      opacity: _isSelected ? 1 : 0.5,
                                      child: const Text(
                                        "SIGNUP",
                                        style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.5,
                                          wordSpacing: 1.5,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Column(
                                children: <Widget>[
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                    width: double.infinity,
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                2,
                                            width: double.infinity,
                                            padding: const EdgeInsets.all(30),
                                            decoration: const BoxDecoration(
                                              gradient: SIGNUP_CARD_BACKGROUND,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(
                                                  15,
                                                ),
                                                bottomLeft: Radius.circular(
                                                  15,
                                                ),
                                              ),
                                            ),
                                            child: PageView.builder(
                                              controller: _pageController,
                                              itemBuilder: (context, index) {
                                                return widgets[index];
                                              },
                                              physics: const BouncingScrollPhysics(),
                                              itemCount: widgets.length,
                                              scrollDirection: Axis.horizontal,
                                            )),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    margin: const EdgeInsets.only(
                                      left: 15,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Colors.white70.withOpacity(0.3),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    margin: const EdgeInsets.only(
                                      left: 30,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Colors.white70.withOpacity(0.2),
                                          blurRadius: 2,
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    margin: const EdgeInsets.only(
                                      left: 45,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Colors.white54.withOpacity(0.2),
                                          blurRadius: 8,
                                          offset: const Offset(0, 3),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 35,
                    left: 97,
                    child: SignUpArrowButton(
                      icon: const IconData(
                        arrow_right,
                        fontFamily: "Icons",
                      ),
                      iconSize: 10,
                      onTap: () => print("Login tapped"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column sigNupColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Welcome",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w400,
            wordSpacing: 2,
            letterSpacing: 2,
          ),
        ),
        const Text(
          "Sign In!",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w400,
            wordSpacing: 2,
            letterSpacing: 2,
          ),
        ),
        Expanded(child: Container()),
        emailTextFieldWidget(),
        SizedBox(
          height: 1.5,
          child: Container(
            color: Colors.black,
          ),
        ),
        Expanded(
          flex: 3,
          child: passwordTextFieldWidget(),
        ),
        const Text(
          "NEXT",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }

  Column loginColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Welcome",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w400,
            wordSpacing: 2,
            letterSpacing: 2,
          ),
        ),
        const Text(
          "back!",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w400,
            wordSpacing: 2,
            letterSpacing: 2,
          ),
        ),
        Expanded(child: Container()),
        emailTextFieldWidget(),
        SizedBox(
          height: 1.5,
          child: Container(
            color: Colors.black,
          ),
        ),
        Expanded(
          flex: 3,
          child: passwordTextFieldWidget(),
        ),
        const Text(
          "NEXT",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }

  Widget emailTextFieldWidget() {
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: Icon(IconData(0xe902, fontFamily: 'Icons'),
              color: Color(0xff35AA90), size: 10.0),
        ),
        hintText: 'Email',
        labelStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        border: InputBorder.none,
      ),
    );
  }

  Widget passwordTextFieldWidget() {
    return TextField(
      controller: _passwordController,
      decoration: const InputDecoration(
        hintText: 'Password',
        labelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        border: InputBorder.none,
      ),
      obscureText: true,
    );
  }
}
