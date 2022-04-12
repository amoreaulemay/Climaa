import 'package:climaa/constants/theme_constants.dart';
import 'package:climaa/models/countries_list.dart';
import 'package:climaa/views/base_view.dart';
import 'package:climaa/views/favourites/favourites_view.dart';
import 'package:climaa/views/home/home_view.dart';
import 'package:climaa/views/menu/menu_view.dart';
import 'package:climaa/views/search/search_view.dart';
import 'package:climaa/views/ui/tab_bar/tab_bar.dart';
import 'package:climaa/views/ui/tab_bar/tab_bar_icon_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Tabs selectedPage = Tabs.home;

  void tabSwitcher(Tabs newTab) {
    setState(() => selectedPage = newTab);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot<AppColours> snapshot) {
        if (snapshot.hasData) {
          return MaterialApp(
            debugShowCheckedModeBanner: false, // TODO: Remove in production.
            theme: snapshot.data!.theme,
            home: BaseView(
              tabSwitcher: tabSwitcher,
              selectedTab: selectedPage,
              theme: snapshot.data!,
            ),
          );
        } else {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('Failed to load theme. $snapshot'),
              ),
              backgroundColor: Colors.white,
            ),
          );
        }
      },
      future: getColours(ThemeName.neondark),
    );
  }
}

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        return Container();
      },
      future: getCountryCode(fromCountryName: 'United States').then((value) => print(value)),
    );
  }
}
