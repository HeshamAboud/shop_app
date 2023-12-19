import 'package:flutter/material.dart';

import 'dart:async';
import 'package:google_places_picker/google_places_picker.dart';
import 'package:intl/intl.dart';
import 'package:nice_ui/page/signup/widgets/signup_arrow_button.dart';

import '../../const/gradient_const.dart';
import '../../const/icons.dart';

class SignPageSeven extends StatefulWidget {
  @override
  _SignPageSevenState createState() => _SignPageSevenState();
}

class _SignPageSevenState extends State<SignPageSeven> {
  String _currentDate = DateFormat('M/d/y').format(DateTime.now());
  List<String> _countries = ["Germany", "Turkey", "Spain"];
  List<String> _states = ["Hessen", "Istanbul", "Barcelona"];
  String _currentCountry = "Germany";
  String _currentState = "Hessen";
  Place? _place;
  int widgetIndex = 0;
  PageController? _pageController;
  bool _isSelected = true;

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

  void changeDropDownCountryItem(String selectedCountry) {
    setState(() {
      _currentCountry = selectedCountry;
    });
  }

  void changeDropDownStateItem(String selectedState) {
    setState(() {
      _currentState = selectedState;
    });
  }

  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2050));
    if (picked != null)
      setState(
        () => _currentDate = DateFormat('M/d/y').format(picked),
      );
  }

  Future _selectPlace(BuildContext context) async {
    try {
      Place _picker = await PluginGooglePlacePicker.showAutocomplete(mode: PlaceAutocompleteMode.MODE_FULLSCREEN);
      setState(() {
        _place = _picker;
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    List<Widget> widgets = [
      buildLoginArea(context),
      buildLoginArea(context),
    ];
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: MediaQuery.of(context).padding,
          height: _media.height,
          width: _media.width,
          decoration:const BoxDecoration(
            gradient: SIGNUP_BACKGROUND,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    height: _media.height,
                    width: _media.width / 2,
                    decoration: BoxDecoration(
                      gradient: _isSelected
                          ? LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.05),
                                Colors.transparent,
                              ],
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              stops: [0.2, 0.8])
                          : null,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Opacity(
                        opacity: _isSelected ? 0.5 : 1,
                        child: const Text(
                          "Log In",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: _media.height,
                    width: _media.width / 2,
                    decoration: BoxDecoration(
                      gradient: !_isSelected
                          ? LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.05),
                                Colors.transparent,
                              ],
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              stops: [0.2, 0.8])
                          : null,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Opacity(
                        opacity: _isSelected ? 1 : 0.5,
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black54,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(
                      top: 110,
                      left: 50,
                      right: 50,
                      bottom: 60,
                    ),
                    height: _media.height,
                    width: _media.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: SIGNUP_CARD_BACKGROUND,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 30,
                          spreadRadius: 0,
                          offset: const Offset(
                            0,
                            10,
                          ),
                        )
                      ],
                    ),
                    child: PageView.builder(
                      controller: _pageController,
                      itemBuilder: (context, index) {
                        return widgets[index];
                      },
                      physics: const BouncingScrollPhysics(),
                      itemCount: widgets.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 80,
                left: 25,
                child: SignUpArrowButton(
                  onTap: () {
                    _pageController!.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                    _selectType(true);
                  },
                  iconSize: 9,
                  icon: const IconData(
                    arrow_left,
                    fontFamily: "Icons",
                  ),
                ),
              ),
              Positioned(
                bottom: 80,
                right: 25,
                child: SignUpArrowButton(
                  onTap: () {
                    _pageController!.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                    _selectType(false);
                  },
                  iconSize: 9,
                  icon: const IconData(
                    arrow_right,
                    fontFamily: "Icons",
                  ),
                ),
              ),
              const Positioned(
                bottom: 80,
                child: Text(
                  "2/3",
                  style: TextStyle(
                    letterSpacing: 2.0,
                    color: Color(0xff353535),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding buildLoginArea(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25.0,
        right: 25,
        top: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          formTextField("DATE OF BIRTH"),
          buildDivider(),
          buildDropdown("COUNTRY", _countries, _currentCountry,
              changeDropDownCountryItem),
          buildDivider(),
          buildDropdown(
              "STATE", _states, _currentState, changeDropDownStateItem),
          buildDivider(),
          buildCity("CITY", context),
          buildDivider(),
          buildStreet("STREET", context),
          buildDivider(),
        ],
      ),
    );
  }

  Widget buildStreet(String text, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          text,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: Colors.black26,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 20),
          child: InkWell(
            onTap: () => _selectPlace(context),
            child: Text(
               _place!.name!,
              style: const TextStyle(
                  letterSpacing: 2.0,
                  color: Color(0xff353535),
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat'),
              overflow: TextOverflow.fade,
            ),
          ),
        )
      ],
    );
  }

  Widget buildCity(String text, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          text,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: Colors.black26,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 20),
          child: InkWell(
            onTap: () => _selectPlace(context),
            child: Text(
              _place!.name!,
              style: const TextStyle(
                  letterSpacing: 2.0,
                  color: Color(0xff353535),
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat'),
              overflow: TextOverflow.fade,
            ),
          ),
        )
      ],
    );
  }

  Widget formTextField(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          text,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: Colors.black26,
          ),
        ),
        TextField(
          keyboardType: TextInputType.datetime,
          onTap: _selectDate,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: _currentDate,
            hintStyle: const TextStyle(
              letterSpacing: 2.0,
              color: Color(0xff353535),
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Icon(
                Icons.arrow_drop_down,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column buildDropdown(
      String text, List dropDownList, String current, Function change) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          text,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: Colors.black26,
          ),
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            style: const TextStyle(
              letterSpacing: 2.0,
              color: Color(0xff353535),
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
            ),
            isExpanded: true,
            onChanged: change(),
            items: dropDownList.map((items) {
              return DropdownMenuItem<String>(
                value: items,
                child: Text(
                  items,
                  style: const TextStyle(
                    letterSpacing: 1.1,
                  ),
                ),
              );
            }).toList(),
            value: current,
          ),
        ),
      ],
    );
  }

  Container buildDivider() {
    return Container(
      margin: const EdgeInsets.only(top: 0, right: 8, bottom: 15),
      padding: const EdgeInsets.only(
        right: 5,
      ),
      color: Colors.black,
      height: 1.2,
    );
  }
}
