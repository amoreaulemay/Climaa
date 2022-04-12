import 'package:climaa/constants/theme_constants.dart';
import 'package:climaa/views/search/search_view.dart';
import 'package:climaa/views/ui/tab_bar/tab_bar.dart';
import 'package:climaa/views/ui/tab_bar/tab_bar_icon_model.dart';
import 'package:flutter/material.dart';

import 'favourites/favourites_view.dart';
import 'home/home_view.dart';
import 'menu/menu_view.dart';

class BaseView extends StatelessWidget {
  final AppColours theme;
  final void Function(Tabs) tabSwitcher;
  final Tabs selectedTab;

  Widget getBody(AppColours theme) {
    switch (selectedTab) {
      case Tabs.home:
        return HomeView(theme: theme);
      case Tabs.search:
        return SearchView(theme: theme);
      case Tabs.favourites:
        return FavouritesView(theme: theme);
      case Tabs.menu:
        return MenuView(theme: theme);
    }
  }

  const BaseView({
    Key? key,
    required this.theme,
    required this.tabSwitcher,
    required this.selectedTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.background,
      body: getBody(theme),
      bottomNavigationBar: ClimaaTabBar(
        theme: theme,
        selectedTab: selectedTab,
        tabSwitcher: tabSwitcher,
      ),
    );
  }
}
