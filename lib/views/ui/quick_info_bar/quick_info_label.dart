import 'package:climaa/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class QuickInfoLabel extends StatelessWidget {
  final AppColours theme;
  final String text;
  final SIIcon _icon;

  Image get icon => Image.asset(
        'assets/images/si/${theme.chosen.name}/${_icon.name}.png',
        height: 20.0,
      );
  MainAxisAlignment get mainAlignment {
    switch (_icon) {
      case SIIcon.humidity:
        return MainAxisAlignment.start;
      case SIIcon.pressure:
        return MainAxisAlignment.center;
      case SIIcon.wind:
        return MainAxisAlignment.end;
    }
  }

  const QuickInfoLabel.humidity({Key? key, required this.theme, required this.text})
      : _icon = SIIcon.humidity,
        super(key: key);

  const QuickInfoLabel.pressure({Key? key, required this.theme, required this.text})
      : _icon = SIIcon.pressure,
        super(key: key);

  const QuickInfoLabel.wind({Key? key, required this.theme, required this.text})
      : _icon = SIIcon.wind,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('assets/images/si/${theme.chosen.name}/humidity.png'), context);
    precacheImage(AssetImage('assets/images/si/${theme.chosen.name}/pressure.png'), context);
    precacheImage(AssetImage('assets/images/si/${theme.chosen.name}/wind.png'), context);

    return Row(
      mainAxisAlignment: mainAlignment,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon,
        const SizedBox(
          width: 10.0,
        ),
        Text(text),
      ],
    );
  }
}

enum SIIcon { humidity, pressure, wind }

extension SIIconExtension on SIIcon {
  String get name => toString().split('.').last;
}
