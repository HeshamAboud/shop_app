import 'package:flutter/material.dart';
import 'package:nice_ui/page/navigation/common/page/home_page.dart';
import 'package:nice_ui/page/walkthrough/page_const.dart';
import 'const/string_const.dart';
import 'const/color_const.dart';
import 'const/page_str_const.dart';
import 'package:flutter/services.dart';
import 'package:nice_ui/page/navigation/navigation1/coordinator.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      title: StringConst.APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: BLUE_DEEP,
        hintColor: YELLOW,
        fontFamily: "Montserrat",
      ),
      home: NavigationOneCoordinator(),
      routes: {
        //PROFILE pages
        PROFILE_PAGES[0]: (context) => ProfilePageOne(),
        PROFILE_PAGES[1]: (context) => ProfilePageTwo(),

        SIGN_UP_PAGES[0]: (context) => SignPageOne(),
        SIGN_UP_PAGES[1]: (context) => SignPageTwo(),
        SIGN_UP_PAGES[2]: (context) => SignPageThree(),
        SIGN_UP_PAGES[3]: (context) => SignPageFour(),
        SIGN_UP_PAGES[4]: (context) => SignPageFive(),
        SIGN_UP_PAGES[5]: (context) => SignPageSix(),
        SIGN_UP_PAGES[6]: (context) => SignPageSeven(),
        SIGN_UP_PAGES[7]: (context) => SignPageEight(),
        SIGN_UP_PAGES[8]: (context) => SignPageNine(),
        SIGN_UP_PAGES[9]: (context) => SignPageTeen(),
        SIGN_UP_PAGES[10]: (context) => SignPageEleven(),

        ///FEED group page
        FEED_PAGES[0]: (context) => FeedPageOne(),
        FEED_PAGES[1]: (context) => FeedPageTwo(),
        FEED_PAGES[2]: (context) => FeedThreePage(),
        FEED_PAGES[3]: (context) => FeedPageFour(),
        FEED_PAGES[4]: (context) => FeedFivePage(),
        FEED_PAGES[9]: (context) => FeedPageTen(),
        FEED_PAGES[10]: (context) => FeedPageEleven(),
        FEED_PAGES[11]: (context) => FeedPageTwelve(),
        FEED_PAGES[12]: (context) => FeedPageThirteen(),

        SHOPPING_PAGES[17]: (context) => ShopPageEighteen(),
        SHOPPING_PAGES[18]: (context) => ShopPageNineteen(),

        NAVIGATION_PAGES[0]: (context) => NavigationOneCoordinator(),
        //FIXME there are other pages to jump with 'page_str_const.dart',there should be make by manager
      },
      onUnknownRoute: (setting) =>
          MaterialPageRoute(builder: (context) => EmptyPage()),
    );
  }
}

showDataAlert({required BuildContext context, required Widget child}) {
  showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            // surfaceTintColor: Color(0xff213555),
            backgroundColor: Colors.white,
            content: child,
          ),
        );
      });
}
