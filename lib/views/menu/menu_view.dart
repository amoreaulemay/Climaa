import 'package:climaa/constants/theme_constants.dart';
import 'package:climaa/views/menu/cards/menu_card_base.dart';
import 'package:climaa/views/ui/list/climaa_list.dart';
import 'package:climaa/views/ui/list/climaa_list_setting.dart';
import 'package:flutter/material.dart';

class MenuView extends StatelessWidget {
  final AppColours theme;

  const MenuView({Key? key, required this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('assets/images/settings_icons/${theme.chosen.name}/rate.png'), context);
    precacheImage(AssetImage('assets/images/settings_icons/${theme.chosen.name}/contact.png'), context);
    precacheImage(AssetImage('assets/images/settings_icons/${theme.chosen.name}/share.png'), context);

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 40.0,
            ),
            child: Text(
              'Settings',
              style: TextStyle(
                color: theme.secondaryText,
                fontSize: 20.0,
                fontFamily: 'Avenir Next',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40.0,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BaseMenuCard.share(theme: theme),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BaseMenuCard.contact(theme: theme),
                      const SizedBox(
                        width: 20.0,
                      ),
                      BaseMenuCard.rate(theme: theme),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ClimaaList(
            theme: theme,
            children: [
              ClimaaListSettingItem(theme: theme, settingName: 'Temperature', settingValue: 'Celcius'),
              ClimaaListSettingItem(theme: theme, settingName: 'Wind Speed', settingValue: 'm/s'),
              ClimaaListSettingItem(theme: theme, settingName: 'Pressure', settingValue: 'Pascals'),
              ClimaaListSettingItem(theme: theme, settingName: 'Theme', settingValue: 'Neon Dark'),
              ClimaaListSettingItem(theme: theme, settingName: 'About / Open Source Licenses', settingValue: ''),
            ],
          ),
        ],
      ),
    );
  }
}
