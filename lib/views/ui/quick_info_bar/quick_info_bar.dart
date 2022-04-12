import 'package:climaa/constants/theme_constants.dart';
import 'package:climaa/models/quick_infos_model.dart';
import 'package:climaa/views/ui/quick_info_bar/quick_info_label.dart';
import 'package:flutter/material.dart';

class QuickInfoBar extends StatelessWidget {
  final AppColours theme;
  final QuickInfosModel quickInfosModel;

  const QuickInfoBar({Key? key, required this.theme, required this.quickInfosModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          QuickInfoLabel.humidity(
            theme: theme,
            text: quickInfosModel.humidity,
          ),
          QuickInfoLabel.pressure(
            theme: theme,
            text: quickInfosModel.pressure,
          ),
          QuickInfoLabel.wind(
            theme: theme,
            text: quickInfosModel.windSpeed,
          ),
        ],
      ),
    );
  }
}
