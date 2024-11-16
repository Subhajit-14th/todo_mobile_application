import 'package:flutter/material.dart';
import 'package:todo_app/models/todoItemModel.dart';

class TodoListProvider extends ChangeNotifier {
  bool _isCraeteNewTodo = false;

  final List<TodoItems> _todos = [
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

  bool get isCraeteNewTodo => _isCraeteNewTodo;

  List<TodoItems> get todoItem => _todos;

  /// is create new todo checking function
  void isCreateNewTodoChecking(bool isCreateNewTodo) {
    _isCraeteNewTodo = isCreateNewTodo;
    notifyListeners();
  }

  /// Add new todo list function
  void addTodoInlist(TodoItems newTodo) {
    _todos.add(newTodo);
    notifyListeners();
  }
}
