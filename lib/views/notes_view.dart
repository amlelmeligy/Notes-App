import 'package:flutter/material.dart';
import 'package:pro/constants.dart';
import 'package:pro/widgets/add_note_bottom_sheet.dart';
import 'package:pro/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        backgroundColor: kColor,
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return const AddNoteBottomSheet();
              });
        },
        child: const Icon(
          Icons.add,
          size: 35,
          color: kSecondaryColor,
        ),
      ),
      body: const NotesViewBody(),
    );
  }
}
