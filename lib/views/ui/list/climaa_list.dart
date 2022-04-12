import 'package:climaa/constants/theme_constants.dart';
import 'package:flutter/material.dart';
import 'climaa_list_separator.dart';

class ClimaaList extends StatefulWidget {
  final List<Widget>? children;
  final AppColours theme;
  final bool _noSeparator;
  final Axis _scrollDirection;

  const ClimaaList({
    Key? key,
    this.children,
    required this.theme,
    Axis? scrollDirection,
  })  : _noSeparator = false,
        _scrollDirection = scrollDirection ?? Axis.vertical,
        super(key: key);

  const ClimaaList.noSeparator({
    Key? key,
    this.children,
    required this.theme,
    Axis? scrollDirection,
  })  : _noSeparator = true,
        _scrollDirection = scrollDirection ?? Axis.vertical,
        super(key: key);

  @override
  State<ClimaaList> createState() => _ClimaaListState();
}

class _ClimaaListState extends State<ClimaaList> {
  List<Widget>? getBody() {
    if (widget.children == null) {
      return null;
    }

    List<Widget> body = [];
    for (final Widget e in widget.children!) {
      body.add(e);

      if (e != widget.children!.last && !widget._noSeparator) {
        body.add(
          ClimaaListSeparator(
            theme: widget.theme,
          ),
        );
      }
    }

    return body;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: widget._scrollDirection,
      child: Padding(
        padding: kClimaaListPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: getBody() ?? [],
        ),
      ),
    );
  }
}
