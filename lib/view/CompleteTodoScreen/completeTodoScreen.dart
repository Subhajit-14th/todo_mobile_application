import 'package:flutter/material.dart';
import 'package:todo_app/common/app_color.dart';

class CompleteTodoScreen extends StatefulWidget {
  const CompleteTodoScreen({super.key});

  @override
  State<CompleteTodoScreen> createState() => _CompleteTodoScreenState();
}

class _CompleteTodoScreenState extends State<CompleteTodoScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.screenbackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            SizedBox(height: height * 0.05),

            /// Profile Heading
            Row(
              children: [
                /// Back Icon
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColor.textColor,
                  ),
                ),
                SizedBox(width: width * 0.06),

                /// Profile Appbar
                const Text(
                  'Complete Todo',
                  style: TextStyle(
                    color: AppColor.textColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.04),

            /// Complete todo item list
            Stack(
              children: [
                Container(
                  height: 160,
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// This is todo title
                      const Text(
                        'This is my first test todo,this is my text',
                        style: TextStyle(
                          color: AppColor.textColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: height * 0.02),

                      /// This is todo subtitle
                      const Text(
                        'My sleep time is too odd, My sleep time is too odd, My sleep time is too odd, My sleep time is too odd',
                        maxLines: 2,
                        style: TextStyle(
                          color: AppColor.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: _showDeleteConfirmationDialog,
                    child: Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.only(left: 10, bottom: 10),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(80),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.delete_forever_rounded,
                          color: AppColor.textColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Show delete confirmation dialog
  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      barrierColor: Colors.transparent, // Semi-transparent background
      barrierDismissible: true, // Enable tap outside to dismiss
      builder: (BuildContext context) {
        return Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 16, right: 16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColor.todoItemColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Material(
              color: Colors.transparent,
              child: Column(
                children: [
                  /// This is todo title
                  const Text(
                    'Are you want to sure to delete this Todo??',
                    style: TextStyle(
                      color: AppColor.textColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  /// Todo buttons
                  SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'No',
                                  style: TextStyle(
                                    color: AppColor.textColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.green.shade300,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'Yes',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
