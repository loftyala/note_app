import 'package:flutter/material.dart';

class NoteAddingPage extends StatefulWidget {
  final Map<String, String>? noteData; // Optional parameter for existing note data

  NoteAddingPage({this.noteData}); // Constructor to accept note data

  @override
  _NoteAddingPageState createState() => _NoteAddingPageState();
}

class _NoteAddingPageState extends State<NoteAddingPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // If noteData is provided, populate the text fields
    if (widget.noteData != null) {
      titleController.text = widget.noteData!['title'] ?? '';
      textController.text = widget.noteData!['text'] ?? '';
    }
  }

  void addNote() {
    String title = titleController.text;
    String text = textController.text;

    // Create a map to hold the note data
    Map<String, String> noteData = {'title': title, 'text': text};

    // Pass the note data back to the previous screen
    Navigator.pop(context, noteData);
  }

  @override
  void dispose() {
    titleController.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add a Note')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: textController,
              decoration: InputDecoration(labelText: 'Write your note here...'),
              maxLines: 10,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: addNote,
              child: Text('Add Note'),
            ),
          ],
        ),
      ),
    );
  }
}
