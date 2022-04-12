import 'package:climaa/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class BlueMarker extends StatelessWidget {
  final AppColours theme;
  final Offset offset;
  final double radius;

  const BlueMarker({Key? key, required this.theme, required this.offset, required this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: offset.dx, top: offset.dy),
      child: SizedBox(
        width: radius * 2,
        height: radius * 2,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.infoBarBlue,
          ),
        ),
      ),
    );
  }
}
