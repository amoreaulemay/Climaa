import 'package:climaa/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class SWIcon extends StatefulWidget {
  final AppColours theme;
  final int iconID;
  final Size? size;

  const SWIcon({Key? key, required this.theme, required this.iconID, this.size}) : super(key: key);

  @override
  State<SWIcon> createState() => _SWIconState();
}

class _SWIconState extends State<SWIcon> {
  String get assetURL => 'assets/images/sw/${widget.theme.chosen.name}/${widget.iconID}.png';

  @override
  void didChangeDependencies() {
    precacheImage(AssetImage(assetURL), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('assets/images/sw/${widget.theme.chosen.name}/1.png'), context);
    precacheImage(AssetImage('assets/images/sw/${widget.theme.chosen.name}/2.png'), context);
    precacheImage(AssetImage('assets/images/sw/${widget.theme.chosen.name}/3.png'), context);
    precacheImage(AssetImage('assets/images/sw/${widget.theme.chosen.name}/4.png'), context);
    precacheImage(AssetImage('assets/images/sw/${widget.theme.chosen.name}/9.png'), context);
    precacheImage(AssetImage('assets/images/sw/${widget.theme.chosen.name}/10.png'), context);
    precacheImage(AssetImage('assets/images/sw/${widget.theme.chosen.name}/11.png'), context);
    precacheImage(AssetImage('assets/images/sw/${widget.theme.chosen.name}/13.png'), context);
    precacheImage(AssetImage('assets/images/sw/${widget.theme.chosen.name}/50.png'), context);

    return Image.asset(
      assetURL,
      width: widget.size?.width,
      height: widget.size?.height,
    );
  }
}
