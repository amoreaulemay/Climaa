import 'package:climaa/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class FavouritesView extends StatelessWidget {
  final AppColours theme;

  const FavouritesView({Key? key, required this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Text('This is favourites view.'),
      ),
    );
  }
}
