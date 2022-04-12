import 'package:climaa/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class BaseMenuCard extends StatelessWidget {
  final AppColours theme;
  final String _assetURL;
  final String _displayT;

  BaseMenuCard.rate({Key? key, required this.theme})
      : _assetURL = 'assets/images/settings_icons/${theme.chosen.name}/rate.png',
        _displayT = 'Rate Us',
        super(key: key);

  BaseMenuCard.contact({Key? key, required this.theme})
      : _assetURL = 'assets/images/settings_icons/${theme.chosen.name}/contact.png',
        _displayT = 'Support',
        super(key: key);

  BaseMenuCard.share({Key? key, required this.theme})
      : _assetURL = 'assets/images/settings_icons/${theme.chosen.name}/share.png',
        _displayT = 'Share',
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
            color: theme.cardBackground,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image.asset(
              _assetURL,
              height: 50.0,
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          _displayT,
          style: TextStyle(
            fontWeight: FontWeight.w100,
            color: theme.secondaryText,
            fontSize: 20.0,
            fontFamily: 'Avenir Next',
          ),
        ),
      ],
    );
  }
}
