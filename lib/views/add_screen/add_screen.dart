import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notepad/views/add_screen/text_filed.dart';
import 'package:notepad/views/home/navbar/custom_nav_bar.dart';
import 'package:notepad/views/utlis/colors.dart';
import 'package:notepad/views/utlis/text_style.dart';

import '../../db/db_helper.dart';

class AddScreen extends StatefulWidget {
  final int? noteId;
  final String? title;
  final String? description;

  const AddScreen({super.key, this.noteId, this.title, this.description});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // If editing, populate the fields with the existing note data
    if (widget.noteId != null) {
      _titleController.text = widget.title!;
      _descriptionController.text = widget.description!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:widget.noteId==null? const HeadingTwo( data:'Add', color: Colors.white) :const HeadingTwo( data:'Edit', color: Colors.white),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(data: 'Enter Title', controller: _titleController),
            const SizedBox(height: 10),
            CustomTextField(data: 'Enter Description', controller: _descriptionController),
            const SizedBox(height: 25),
            SizedBox(
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (widget.noteId == null) {
                      // Insert new record
                      await DataBaseHelper.instance.insertRecord({
                        'title': _titleController.text,
                        'description': _descriptionController.text,
                      });
                      Get.snackbar('Success', 'Data Has Been Saved');
                    } 
                    else {
                      // Update existing record
                      await DataBaseHelper.instance.updateRecord({
                        'id': widget.noteId,
                        'title': _titleController.text,
                        'description': _descriptionController.text,
                      });
                      Get.snackbar('Success', 'Data Has Been Edited');
                    }
                    Get.offAll(const CustomNavbar()); // Go back to the previous screen
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
                child: const HeadingTwo(data: 'Save', color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

