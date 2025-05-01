import 'package:flutter/material.dart';

class PlusButton extends StatefulWidget {
  const PlusButton({super.key});

  @override
  State<PlusButton> createState() => _PlusButtonState();
}

class _PlusButtonState extends State<PlusButton> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return TextButton(
      onPressed: () {},
      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(themeData.colorScheme.onPrimary)),
      child: Text(
        "+",
        style: themeData.textTheme.titleMedium!.copyWith(fontSize: 35)
      ),
    );
  }
}
