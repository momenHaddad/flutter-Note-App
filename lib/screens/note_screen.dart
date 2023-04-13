import 'package:flutter/material.dart';
import 'package:flutter_application_5/models/note_model.dart';
import 'package:flutter_application_5/services/database_helper.dart';

class NoteScreen extends StatefulWidget {
  final Note? note;
  final Function(Color) cucolor;
  final Function(Color) onColorSelected;
  const NoteScreen({Key? key, this.note, required this.onColorSelected, required this.cucolor}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    if (widget.note != null) {
      titleController.text = widget.note!.title;
      descriptionController.text = widget.note!.description;
    }

    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        title: Text(widget.note == null ? 'Add a note' : 'Edit note'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 0.0),
              child: TextFormField(
                style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                controller: titleController,
                maxLines: 1,
                decoration: const InputDecoration(hintText: 'Title', border: InputBorder.none),
              ),
            ),
            const Divider(
              height: 2,
              color: Colors.black26,
              thickness: 2,
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(hintText: 'Type here the note', border: InputBorder.none),
              keyboardType: TextInputType.multiline,
              onChanged: (str) {},
              maxLines: 5,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      Colors.red;
                    });
                  },
                  heroTag: "red",
                  child: Text(''),
                  mini: true,
                  backgroundColor: Colors.red,
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      Colors.deepPurple;
                    });
                  },
                  heroTag: "deepPurple",
                  child: Text(''),
                  mini: true,
                  backgroundColor: Colors.deepPurple,
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      Colors.blue;
                    });
                  },
                  heroTag: "blue",
                  child: Text(''),
                  mini: true,
                  backgroundColor: Colors.blue,
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      Colors.green;
                    });
                  },
                  heroTag: "green",
                  child: Text(''),
                  mini: true,
                  backgroundColor: Colors.green,
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      Colors.yellow;
                    });
                  },
                  heroTag: "yellow",
                  child: Text(''),
                  mini: true,
                  backgroundColor: Colors.yellow,
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      Colors.orange;
                    });
                  },
                  heroTag: "orange",
                  child: Text(''),
                  mini: true,
                  backgroundColor: Colors.orange,
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () async {
                      final title = titleController.value.text;
                      final description = descriptionController.value.text;

                      if (title.isEmpty || description.isEmpty) {
                        return;
                      }

                      final Note model = Note(title: title, description: description, id: widget.note?.id);
                      if (widget.note == null) {
                        await DatabaseHelper.addNote(model);
                      } else {
                        await DatabaseHelper.updateNote(model);
                      }

                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.orange.shade500,
                        ),
                        shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.orange,
                              width: 0.75,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            )))),
                    child: Text(
                      widget.note == null ? 'Save' : 'Edit',
                      style: const TextStyle(fontSize: 20),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
