import 'package:flutter/material.dart';
import 'package:note_app/AddNote.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Map<String, String>> notes = []; // List to hold notes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All notes', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Wait for the result from NoteAddingPage
          final noteData = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => NoteAddingPage()),
          );

          // Check if noteData is not null
          if (noteData != null) {
            setState(() {
              notes.add(noteData); // Add the new note to the list
            });
          }
        },
        child: const Icon(Icons.add_rounded),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NoteAddingPage(noteData: notes[index]),
                ),
              );
            },
            child: ListTile(
              title: Text(notes[index]['title'] ?? '', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              subtitle: Text(notes[index]['text'] ?? '', style: const TextStyle(fontSize: 18)),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    notes.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
