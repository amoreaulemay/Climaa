import 'package:climaa/constants/theme_constants.dart';
import 'package:climaa/views/detailed_view.dart';
import 'package:climaa/views/ui/climaa.dart';
import 'package:climaa/views/ui/list/helpers/climaa_list_rhs_navigation.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ClimaaListSettingItem extends StatelessWidget {
  final AppColours theme;
  final String settingName;
  final String settingValue;
  final Widget? navigationRoute;

  const ClimaaListSettingItem({
    Key? key,
    required this.theme,
    required this.settingName,
    required this.settingValue,
    this.navigationRoute,
  }) : super(key: key);

  void navigation(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailedView(
          title: 'Test',
          theme: theme,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigation(context);
      },
      child: ClimaaListTextItem(
        uuid: const Uuid().v4(),
        child: Text(
          settingName,
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),
        rightHand: ClimaaListRHSNavigation(
          displayText: settingValue,
          theme: theme,
        ),
      ),
    );
  }
}
