import 'package:climaa/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class ClimaaListSeparator extends StatelessWidget {
  final AppColours theme;

  const ClimaaListSeparator({Key? key, required this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.0,
      child: Container(
        color: theme.cardBackground,
      ),
    );
  }
}
