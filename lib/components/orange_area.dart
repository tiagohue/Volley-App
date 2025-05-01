import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OrangeArea extends StatefulWidget {
  Widget child;
  OrangeArea({super.key, required this.child});

  @override
  State<StatefulWidget> createState() => _OrangeAreaState();
}

class _OrangeAreaState extends State<OrangeArea> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffF77859),
          border: Border.all(width: 2, color: colorScheme.primary),
        ),
        child: Center(child: widget.child),
      ),
    );
  }
}
