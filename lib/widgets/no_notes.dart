import 'package:flutter/material.dart';

class NoNotes extends StatelessWidget {
  const NoNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/defalut button.png',
          width: 200,
        ),
        const SizedBox(height: 50),
        const Text(
          'No notes yet.',
          style: TextStyle(
            fontSize: 25,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Tap + to add a new note!',
          style: TextStyle(
            fontSize: 22,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
