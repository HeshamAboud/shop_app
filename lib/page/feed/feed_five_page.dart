///
/// Created by NieBin on 18-12-24
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
import "package:flutter/material.dart";
import 'package:nice_ui/const/color_const.dart';
import 'package:nice_ui/page/feed/top_title.dart';

import '../../util/GradientUtil.dart';
import '../../util/SizeUtil.dart';
import 'feed_const.dart';



class FeedFivePage extends StatefulWidget {
  @override
  _FeedFiveState createState() => _FeedFiveState();
}

class _FeedFiveState extends State<FeedFivePage> {
  var _value = "";

  Widget _bottomImg() => Container(
      constraints: const BoxConstraints.expand(),
      child: Container(
        constraints: BoxConstraints.expand(height: SizeUtil.getAxisY(620)),
        alignment: Alignment.bottomCenter,
        child: Image.asset(
          FeedImage.feed5_pic_01,
          fit: BoxFit.cover,
        ),
      ));

  Widget _content1() => Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        height: SizeUtil.getAxisBoth(72),
        width: SizeUtil.getAxisBoth(72),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(FeedImage.feed12_header),
          ),
        ),
      ),
      Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            style: TextStyle(
                fontSize: SizeUtil.getAxisBoth(TEXT_NORMAL_SIZE),
                color: TEXT_BLACK),
            decoration: InputDecoration(
              hintText: "Write something ...",
              border: UnderlineInputBorder(
                  borderSide: const BorderSide(style: BorderStyle.none, width: 0),
                  borderRadius: BorderRadius.circular(10)),
            ),
            cursorColor: YELLOW,
          ),
        ),
      ),
      Text(
        _value,
        style: TextStyle(
          color: TEXT_BLACK,
          fontSize: SizeUtil.getAxisBoth(TEXT_NORMAL_SIZE),
        ),
      ),
      PopupMenuButton(
        itemBuilder: (context) => [
          const PopupMenuItem(
            value: 1,
            child: Text("Common"),
          ),
          const PopupMenuItem(
            value: 2,
            child: Text("VIP"),
          ),
        ],
        icon: const Icon(
          Icons.arrow_drop_down,
          size: 20,
        ),
        onSelected: (value) {
          setState(() {
            _value = value == 1 ? "Common" : "VIP";
          });
        },
      )
    ],
  );

  Widget _content2() => Container(
    margin: EdgeInsets.symmetric(
      vertical: SizeUtil.getAxisY(50),
    ),
    child: Row(
      children: <Widget>[
        SizedBox(width: SizeUtil.getAxisX(22)),
        Icon(
          Icons.camera_alt,
          size: SizeUtil.getAxisBoth(28),
        ),
        SizedBox(width: SizeUtil.getAxisX(64)),
        const Text("Photo", style: TextStyle(color: TEXT_BLACK)),
        Expanded(
            child: Container(
              constraints: BoxConstraints.expand(
                height: SizeUtil.getAxisBoth(78),
              ),
              alignment: Alignment.centerRight,
              child: Container(
                height: SizeUtil.getAxisBoth(78),
                width: SizeUtil.getAxisBoth(78),
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage(
                          FeedImage.city,
                        ),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(4)),
              ),
            ))
      ],
    ),
  );

  Widget _content3() => Container(
    margin: EdgeInsets.symmetric(
      vertical: SizeUtil.getAxisY(50),
    ),
    child: Row(
      children: <Widget>[
        SizedBox(width: SizeUtil.getAxisX(22)),
        Icon(
          Icons.edit,
          size: SizeUtil.getAxisBoth(28),
        ),
        SizedBox(width: SizeUtil.getAxisX(64)),
        const Text(
          "Status",
          style: TextStyle(color: TEXT_BLACK),
        ),
      ],
    ),
  );

  Widget _content4() => Container(
    margin: EdgeInsets.symmetric(
      vertical: SizeUtil.getAxisY(50),
    ),
    child: Row(
      children: <Widget>[
        SizedBox(width: SizeUtil.getAxisX(22)),
        Icon(
          Icons.location_on,
          size: SizeUtil.getAxisBoth(28),
        ),
        SizedBox(width: SizeUtil.getAxisX(64)),
        const Text(
          "Location",
          style: TextStyle(color: TEXT_BLACK),
        ),
      ],
    ),
  );

  Widget _line() => Container(
    color: TEXT_BLACK,
    constraints: const BoxConstraints.expand(height: 1),
  );

  Widget _upContent() => Container(
    constraints: BoxConstraints.expand(height: SizeUtil.getAxisY(640)),
    margin: EdgeInsets.symmetric(
      vertical: SizeUtil.getAxisY(48),
      horizontal: SizeUtil.getAxisX(44),
    ),
    padding: EdgeInsets.symmetric(
      horizontal: SizeUtil.getAxisX(38),
      vertical: SizeUtil.getAxisY(50),
    ),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: GradientUtil.red()),
    child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _content1(),
          _content2(),
          _line(),
          _content3(),
          _line(),
          _content4()
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: GradientUtil.yellowGreen()),
        child: Column(
          children: <Widget>[
            TopTitleBar(),
            Expanded(
              child: Stack(
                children: <Widget>[
                  _bottomImg(),
                  _upContent(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
