import 'package:climaa/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class ClimaaListRHSNavigation extends StatelessWidget {
  final AppColours theme;
  final String displayText;

  const ClimaaListRHSNavigation({Key? key, required this.theme, required this.displayText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          displayText,
          style: TextStyle(
            color: theme.linkText,
            fontSize: 12.0,
          ),
        ),
        const Icon(
          Icons.chevron_right_outlined,
          size: 25,
        ),
      ],
    );
  }
}
