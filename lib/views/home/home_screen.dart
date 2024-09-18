import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notepad/views/utlis/colors.dart';
import 'package:notepad/views/utlis/text_style.dart';
import '../../db/db_helper.dart';
import '../add_screen/add_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> _notes = [];

  @override
  void initState() {
    super.initState();
    _fetchNotes();
  }

  _fetchNotes() async {
    final notes = await DataBaseHelper.instance.queryDatabase();
    setState(() {
      _notes = notes;
    });
  }

  // Method to delete a note
  _deleteNote(int id) async {
    await DataBaseHelper.instance.deleteRecord(id);
    _fetchNotes(); // Refresh the list after deletion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        title: const HeadingTwo(data: 'NotePad', color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title: HeadingThree(data: '${_notes[index]['title']}'),
                subtitle: HeadingFour(data: '${_notes[index]['description']}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min, // Ensure the row size fits
                  children: [
                    IconButton(
                      onPressed: () {
                        // Navigate to AddScreen with note data
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddScreen(
                              noteId: _notes[index]['id'],
                              title: _notes[index]['title'],
                              description: _notes[index]['description'],
                            ),
                          ),
                        ).then((_) {
                          _fetchNotes(); // Refresh the notes after returning
                        });
                      },
                      icon: const Icon(Icons.edit, color: Colors.black),
                    ),
                    IconButton(
                      onPressed: () {
                        _deleteNote(_notes[index]['id']);
                        Get.snackbar('Success', 'Data Has Been Deleted');
                      },
                      icon: const Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
                leading: CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  child: const HeadingTwo(data: 'T', color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
