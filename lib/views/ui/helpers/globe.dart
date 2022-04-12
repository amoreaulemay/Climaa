import 'package:flutter/material.dart';

class Globe extends StatelessWidget {
  final BoxDecoration decoration;
  final double size;

  const Globe({Key? key, required this.decoration, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Container(
        decoration: decoration,
      ),
    );
  }
}
