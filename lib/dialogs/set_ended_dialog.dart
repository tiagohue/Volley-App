import 'package:flutter/material.dart';
import 'package:myapp/buttons/standard_button.dart';

class SetEndedDialog extends StatelessWidget {
  const SetEndedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("FIM DE SET"),
      backgroundColor: const Color.fromARGB(125, 255, 255, 255),
      content: Column(
        children: [
          Text("AUTOCONVIDADOS venceu")
        ],
      ),
      actions: [
        StandardButton(onPressed: () {}, text: "bazinga")
      ],
    );
  }
}
