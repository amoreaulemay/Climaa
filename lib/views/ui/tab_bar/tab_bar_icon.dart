import 'package:climaa/constants/theme_constants.dart';
import 'package:climaa/views/ui/tab_bar/tab_bar_icon_model.dart';
import 'package:flutter/material.dart';

class TabBarIcon extends StatefulWidget {
  final bool isActive;
  final AppColours theme;
  final TabBarIconModel _images;
  final Function? callback;
  final Tabs _tab;

  TabBarIcon.home({Key? key, required this.isActive, required this.theme, this.callback})
      : _images = theme.tabBarHome,
        _tab = Tabs.home,
        super(key: key);
  TabBarIcon.search({Key? key, required this.isActive, required this.theme, this.callback})
      : _images = theme.tabBarSearch,
        _tab = Tabs.search,
        super(key: key);
  TabBarIcon.favourites({Key? key, required this.isActive, required this.theme, this.callback})
      : _images = theme.tabBarFavourites,
        _tab = Tabs.favourites,
        super(key: key);
  TabBarIcon.menu({Key? key, required this.isActive, required this.theme, this.callback})
      : _images = theme.tabBarMenu,
        _tab = Tabs.menu,
        super(key: key);

  @override
  _TabBarIconState createState() => _TabBarIconState();
}

class _TabBarIconState extends State<TabBarIcon> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.0,
      height: 40.0,
      child: GestureDetector(
        onTap: () => widget.callback!(widget._tab),
        child: Image.asset(
          'assets/images/tab_bar_icons/' + (widget.isActive ? widget._images.active : widget._images.inactive),
          height: 25.0,
        ),
      ),
    );
  }
}
