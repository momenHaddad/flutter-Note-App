import 'package:flutter/material.dart';
import 'package:flutter_application_5/models/note_model.dart';

class NoteWidget extends StatefulWidget {
  final Note note;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  const NoteWidget({Key? key, required this.note, required this.onTap, required this.onLongPress}) : super(key: key);

  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  Color selectedColor = Colors.orange.shade300;

  void onColorSelected(Color cucolor) {
    setState(() {
      selectedColor = cucolor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: widget.onLongPress,
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          color: selectedColor,
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.note.title,
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 6,
                  ),
                  child: Divider(
                    thickness: 1.3,
                    color: Colors.black26,
                  ),
                ),
                Text(widget.note.description, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
