import 'package:flutter/material.dart';
import 'package:todo_app/TodoItemsScreen/todoItemScreen.dart';
import 'package:todo_app/common/app_color.dart';
import 'package:todo_app/models/todoItemModel.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  TextEditingController todoSearchController = TextEditingController();

  List<TodoItems> todoItems = [
    TodoItems(
        title: 'This is my first test todo,this is my text',
        description: 'My sleep time is too odd',
        isComplete: false),
    TodoItems(
        title: 'Sleep Time',
        description:
            'My sleep time is too odd, My sleep time is too odd, My sleep time is too odd, My sleep time is too odd',
        isComplete: false),
    TodoItems(
        title: 'Sleep Time',
        description: 'My sleep time is too odd',
        isComplete: false),
    TodoItems(
        title: 'Sleep Time',
        description: 'My sleep time is too odd',
        isComplete: false),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.screenbackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.07),

            /// This is welcome heading
            const Text(
              'Hello 👋',
              style: TextStyle(
                color: AppColor.textColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            /// This is welcome heading two
            const Text(
              'Subhajit',
              style: TextStyle(
                color: AppColor.textColor,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: height * 0.02),

            /// This is search textfield
            SizedBox(
              width: double.infinity,
              child: TextFormField(
                controller: todoSearchController,
                decoration: InputDecoration(
                    hintText: 'search...',
                    focusColor: Colors.white,
                    hintStyle: const TextStyle(
                      color: AppColor.textColor,
                      fontWeight: FontWeight.w500,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: AppColor.borderColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: AppColor.borderColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: AppColor.borderColor,
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(left: 18)),
                style: const TextStyle(
                  color:
                      AppColor.textColor, // Change this to your desired color
                  fontSize:
                      16, // Optional: Set the font size or any other style properties
                ),
                cursorColor: AppColor.cursorColor,
                onChanged: (value) {},
              ),
            ),
            SizedBox(height: height * 0.02),

            /// List of todo items
            Expanded(
              child: ListView.builder(
                itemCount: todoItems.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return TodoItemScreen(
                    todoTitle: todoItems[index].title,
                    todoDescription: todoItems[index].description,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.screenbackgroundColor,
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: AppColor.textColor,
        ),
      ),
    );
  }
}
