import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StandardButton extends StatefulWidget {
  VoidCallback onPressed;
  String text;
  double textSize;
  double horizontalPadding;
  Color textColor;

  StandardButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textSize = 40,
    this.horizontalPadding = 10,
    this.textColor = const Color(0xffC2F2F8),
  });

  @override
  State<StatefulWidget> createState() => _StandardButtonState();
}

class _StandardButtonState extends State<StandardButton> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.onPrimary,
          border: Border.all(width: 3, color: colorScheme.primary),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
        child: Text(
          widget.text,
          style: TextStyle(
            color: widget.textColor,
            fontSize: widget.textSize,
            fontFamily: 'ConcertOne',
          ),
        ),
      ),
    );
  }
}
