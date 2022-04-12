import 'package:climaa/constants/theme_constants.dart';
import 'package:climaa/views/ui/tab_bar/tab_bar_icon.dart';
import 'package:climaa/views/ui/tab_bar/tab_bar_icon_model.dart';
import 'package:flutter/material.dart';

class ClimaaTabBar extends StatefulWidget {
  final AppColours theme;
  final Tabs selectedTab;
  final Function(Tabs) tabSwitcher;

  const ClimaaTabBar({Key? key, required this.theme, required this.selectedTab, required this.tabSwitcher}) : super(key: key);

  @override
  State<ClimaaTabBar> createState() => _ClimaaTabBarState();
}

class _ClimaaTabBarState extends State<ClimaaTabBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: widget.theme.background,
        padding: const EdgeInsets.only(
          top: 20.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBarIcon.home(
              isActive: widget.selectedTab == Tabs.home,
              theme: widget.theme,
              callback: widget.tabSwitcher,
            ),
            TabBarIcon.search(
              isActive: widget.selectedTab == Tabs.search,
              theme: widget.theme,
              callback: widget.tabSwitcher,
            ),
            TabBarIcon.favourites(
              isActive: widget.selectedTab == Tabs.favourites,
              theme: widget.theme,
              callback: widget.tabSwitcher,
            ),
            TabBarIcon.menu(
              isActive: widget.selectedTab == Tabs.menu,
              theme: widget.theme,
              callback: widget.tabSwitcher,
            ),
          ],
        ),
      ),
    );
  }
}
