import 'package:flutter/material.dart';

class GenerericAlert extends StatelessWidget {
  final String message;
  const GenerericAlert({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      title: const Text('Atenção'),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), // Closes the alert
          child: const Text('OK', style: TextStyle(color: Color(0xFF06223a))),
        ),
      ],
    );
  }
}
