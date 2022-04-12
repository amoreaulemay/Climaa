import 'package:climaa/constants/theme_constants.dart';
import 'package:flutter/material.dart';

/// This card is intended to be used in [ListView] and should therefore have a defined height.
class ClimaaCard extends StatelessWidget {
  final AppColours theme;
  final Size size;
  final Widget? child;

  const ClimaaCard({Key? key, required this.theme, required this.size, this.child}) : super(key: key);

  ClimaaCard.withHeight({Key? key, required double of, required AppColours withTheme, this.child})
      : theme = withTheme,
        size = Size(double.infinity, of),
        super(key: key);

  const ClimaaCard.searchResult({Key? key, required this.theme, this.child})
      : size = const Size(double.infinity, kSearchResultsCardHeight),
        super(key: key);

  const ClimaaCard.expanded({Key? key, required AppColours withTheme, this.child})
      : theme = withTheme,
        size = const Size(double.infinity, double.infinity),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Container(
        margin: kClimaaCardPadding,
        decoration: BoxDecoration(
          color: theme.cardBackground,
          borderRadius: BorderRadius.all(
            Radius.circular((size.height - kClimaaCardPadding.vertical) * 0.15),
          ),
        ),
        child: child,
      ),
    );
  }
}
