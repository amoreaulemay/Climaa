import 'package:flutter/material.dart';

// TODO: Document
class Offsetter extends StatelessWidget {
  final Widget? child;
  final Offset? offset;

  const Offsetter({Key? key, this.child, this.offset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: offset?.dx ?? 0,
        top: offset?.dy ?? 0,
      ),
      child: child,
    );
  }
}
