import 'package:climaa/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class DetailedView extends StatelessWidget {
  final String title;
  final Widget? child;
  final AppBar? customAppBar;
  final AppColours theme;

  const DetailedView({
    Key? key,
    required this.title,
    this.child,
    this.customAppBar,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.background,
      appBar: customAppBar ??
          AppBar(
            title: Text(title),
            backgroundColor: theme.cardBackground,
          ),
      body: child,
    );
  }
}
