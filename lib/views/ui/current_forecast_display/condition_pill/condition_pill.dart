import 'package:climaa/constants/theme_constants.dart';
import 'package:flutter/material.dart';
import 'condition_pill_constants.dart';

class ConditionPill extends StatelessWidget {
  final AppColours theme;
  final String condition;

  const ConditionPill({Key? key, required this.theme, required this.condition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kPillPadding,
      decoration: BoxDecoration(
        color: theme.pillBackground,
        borderRadius: kPillBorderRadius,
      ),
      child: Padding(
        padding: kPillPadding,
        child: Text(
          condition,
          style: kPillTextStyle,
        ),
      ),
    );
  }
}
