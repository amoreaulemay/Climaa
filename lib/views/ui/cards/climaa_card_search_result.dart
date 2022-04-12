import 'package:climaa/constants/theme_constants.dart';
import 'package:climaa/views/ui/helpers/protocols/theme_protocol.dart';
import 'package:flutter/material.dart';

/// Intended to be a child widget of [ClimaaCard], this structures the content to fit a search result.
///
/// ## Params
/// * [AppColours theme] : The inherited theme for the app.
/// * [bool isFavourite] : If the card should be displayed as a favourite.
/// * [Function? favouriteCallback] : The callback that should trigger if the favourite button is pressed.
class ClimaaCardSearchResult extends StatefulWidget implements ThemeProtocol {
  @override
  final AppColours theme;
  final bool isFavourite;
  final Function? favouriteCallback;
  final Function? navigationCallback;
  final CityNameDisplay cityName;
  final String? cityDetails;
  final int cityID;

  const ClimaaCardSearchResult({
    Key? key,
    required this.theme,
    required this.isFavourite,
    this.favouriteCallback,
    this.navigationCallback,
    required this.cityName,
    this.cityDetails,
    required this.cityID,
  }) : super(key: key);

  @override
  State<ClimaaCardSearchResult> createState() => _ClimaaCardSearchResultState();
}

class _ClimaaCardSearchResultState extends State<ClimaaCardSearchResult> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            height: double.infinity,
            child: SizedBox(
              width: 15,
              height: 15,
              child: Icon(
                widget.isFavourite ? Icons.grade : Icons.grade_outlined,
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.cityName,
              Text(
                widget.cityDetails ?? '',
                style: widget.theme.searchResultsCityDetails,
              ),
            ],
          ),
        ),
        Center(
          child: Container(
            margin: const EdgeInsets.only(
              right: 20,
            ),
            height: double.infinity,
            child: const SizedBox(
              height: 10,
              child: Icon(
                Icons.chevron_right_outlined,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CityNameDisplay extends StatelessWidget implements ThemeProtocol {
  @override
  final AppColours theme;
  final String? text;
  final String? predictiveText;

  const CityNameDisplay({Key? key, this.text, this.predictiveText, required this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: theme.searchResultsCityName,
        children: [
          TextSpan(text: predictiveText, style: theme.searchResultsCityNamePredictive),
        ],
      ),
    );
  }
}
