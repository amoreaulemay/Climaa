import 'package:climaa/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class ClimaaListTextItem extends StatefulWidget {
  final Text? child;
  final Widget? rightHand;
  final bool _selectable;
  final bool _selected;
  final String uuid;
  final Function? _callback;

  const ClimaaListTextItem({
    Key? key,
    this.child,
    this.rightHand,
    required this.uuid,
  })  : _selectable = false,
        _selected = false,
        _callback = null,
        super(key: key);

  const ClimaaListTextItem.selectable({
    Key? key,
    this.child,
    required bool currentlySelected,
    required this.uuid,
    required Function callback,
  })  : _selectable = true,
        _selected = currentlySelected,
        _callback = callback,
        rightHand = null, // TODO: Add checkmark widget.
        super(key: key);

  @override
  State<ClimaaListTextItem> createState() => _ClimaaListTextItemState();
}

class _ClimaaListTextItemState extends State<ClimaaListTextItem> {
  List<Widget> getBody() {
    List<Widget> body = [];

    if (widget.child != null) {
      body.add(widget.child!);
    }
    if (widget.rightHand != null) {
      body.add(widget.rightHand!);
    }

    return body;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 16.0,
        ),
        Padding(
          padding: kClimaaListItemPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: getBody(),
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
