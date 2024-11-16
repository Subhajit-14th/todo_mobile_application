import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/common/app_color.dart';
import 'package:todo_app/models/todoItemModel.dart';
import 'package:todo_app/viewmodel/todoListProvider.dart';

class TodoCreateScreen extends StatefulWidget {
  const TodoCreateScreen({super.key});

  @override
  State<TodoCreateScreen> createState() => _TodoCreateScreenState();
}

class _TodoCreateScreenState extends State<TodoCreateScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _desCriptionController = TextEditingController();

  bool isAlreadyCheck = false;

  int _characterCount = 0;
  int _descriptionCount = 0;

  // Function to update character count and enforce limit
  void _updateCharacterCount(String value) {
    final characters = value.replaceAll(RegExp(r'\s+'), ''); // Remove spaces
    if (characters.length > 40) {
      // If character count exceeds 40, truncate text and update the controller
      final truncatedText = characters.substring(0, 40);
      _titleController.value = TextEditingValue(
        text: truncatedText,
        selection: TextSelection.collapsed(offset: truncatedText.length),
      );
      setState(() {
        _characterCount = 40;
      });
    } else {
      setState(() {
        _characterCount = characters.length;
      });
    }
  }

  void _updateDescriptionCharacterCount(String value) {
    final characters = value.replaceAll(RegExp(r'\s+'), ''); // Remove spaces
    if (characters.length > 120) {
      // If character count exceeds 40, truncate text and update the controller
      final truncatedText = characters.substring(0, 120);
      _desCriptionController.value = TextEditingValue(
        text: truncatedText,
        selection: TextSelection.collapsed(offset: truncatedText.length),
      );
      setState(() {
        _descriptionCount = 120;
      });
    } else {
      setState(() {
        _descriptionCount = characters.length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final todoItems = Provider.of<TodoListProvider>(context);
    return Scaffold(
      backgroundColor: AppColor.screenbackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.07),

            /// This is welcome heading
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColor.textColor,
                  ),
                ),
                SizedBox(width: width * 0.02),
                const Text(
                  'Create Todo',
                  style: TextStyle(
                    color: AppColor.textColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.02),

            /// Title Heading
            const Text(
              'Title',
              style: TextStyle(
                color: AppColor.textColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: height * 0.01),

            /// This is title textfield
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColor.borderColor,
                  ),
                ),
                child: Column(
                  children: [
                    /// Title Textfield
                    _craeteTodoTextfield(
                      controller: _titleController,
                      hintText: 'title...',
                      onChanged: _updateCharacterCount,
                    ),
                    SizedBox(height: height * 0.02),

                    /// Title itemcount
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '$_characterCount / 40',
                        style: const TextStyle(
                            fontSize: 16,
                            color: AppColor.textColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.02),

            /// Description Heading
            const Text(
              'Description',
              style: TextStyle(
                color: AppColor.textColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: height * 0.01),

            /// This is description textfield
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColor.borderColor,
                  ),
                ),
                child: Column(
                  children: [
                    /// Title Textfield
                    _craeteTodoTextfield(
                      controller: _desCriptionController,
                      hintText: 'description',
                      onChanged: _updateDescriptionCharacterCount,
                    ),
                    SizedBox(height: height * 0.02),

                    /// Title itemcount
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '$_descriptionCount / 120',
                        style: const TextStyle(
                            fontSize: 16,
                            color: AppColor.textColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
          ],
        ),
      ),
      bottomNavigationBar: Consumer<TodoListProvider>(
        builder: (context, value, child) {
          return Material(
            color: Colors.transparent, // Set the color to transparent
            borderRadius: BorderRadius.circular(
                30), // Match the container's border radius
            child: Container(
              height: height * 0.06,
              margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
              decoration: BoxDecoration(
                color: AppColor.screenbackgroundColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: value.isCraeteNewTodo
                  ? const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        color: AppColor.screenbackgroundColor,
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        if (_titleController.text.isNotEmpty &&
                            _desCriptionController.text.isNotEmpty) {
                          todoItems.addTodoInlist(TodoItems(
                            title: _titleController.text,
                            description: _desCriptionController.text,
                            isComplete: false,
                          ));
                          todoItems.isCreateNewTodoChecking(true);

                          Future.delayed(
                            const Duration(seconds: 3),
                            () {
                              todoItems.isCreateNewTodoChecking(false);
                              Navigator.pop(context);
                            },
                          );
                        } else {
                          // Show an error message if fields are empty
                          customSnackBar(context);
                        }
                      },
                      splashColor:
                          Colors.white.withOpacity(0.3), // Set splash color
                      highlightColor:
                          Colors.white.withOpacity(0.1), // Set highlight color
                      borderRadius: BorderRadius.circular(30),
                      child: const Center(
                        child: Text(
                          'Create Todo',
                          style: TextStyle(
                            color: AppColor.textColor,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }

  /// Textfield widget
  Widget _craeteTodoTextfield(
      {required TextEditingController controller,
      required String hintText,
      required Function(String)? onChanged}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          focusColor: Colors.white,
          hintStyle: const TextStyle(
            color: AppColor.textColor,
            fontWeight: FontWeight.w500,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          contentPadding: const EdgeInsets.only(left: 18, top: 10, bottom: 10)),
      style: const TextStyle(
        color: AppColor.textColor, // Change this to your desired color
        fontSize:
            16, // Optional: Set the font size or any other style properties
      ),
      maxLines: 2,
      cursorColor: AppColor.cursorColor,
      onChanged: onChanged,
    );
  }

  /// Custom Snack bar
  customSnackBar(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.info_outline_rounded, color: Colors.white),
            SizedBox(width: 10),
            Text('Please fill in both Title and Description'),
          ],
        ),
        backgroundColor: const Color(0xFF1A1B20),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
