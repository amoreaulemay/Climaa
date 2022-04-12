import 'package:flutter/material.dart';

class LWDisplay extends StatelessWidget {
  final String assetUrl;

  const LWDisplay({Key? key, required this.assetUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(width: MediaQuery.of(context).size.width / 2 + 50),
        child: FittedBox(
          child: Image.asset(
            assetUrl,
            height: 300,
          ),
          fit: BoxFit.none,
          clipBehavior: Clip.hardEdge,
          alignment: Alignment.bottomLeft,
        ),
      ),
    );
  }
}
