import 'package:flutter/material.dart';
import 'package:task_manager_app/functiontoadd.dart';
import 'package:task_manager_app/class_detail.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  List<Todo> todos = [];
  List<String> categories = [];

  // ignore: unused_element
  double _getCompletedTodosValue() {
    int numberOfCompletedTodos = 0;
    for (int i = 0; i < todos.length; i++) {
      if (todos[i].isCompleted) {
        numberOfCompletedTodos++;
      }
    }
    if (todos.isEmpty) {
      return 0.0;
    }
    return (numberOfCompletedTodos / todos.length);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 150, 187, 248),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          centerTitle: true,
          title: const Text('QuickTask'),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        body: const Padding(
          
          padding: EdgeInsets.all(10),
          child: Text(
            'Task ToDo',
            style: TextStyle(
              color: Color.fromARGB(255, 68, 136, 245),
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        floatingActionButton: Builder(
          builder: (context) {
            return ElevatedButton.icon(
              onPressed: () async {
                final Todo? todo = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const AddDetail()),
                );
                if (todo != null && todo.title.isNotEmpty) {
                  setState(() {
                    todos.add(todo);
                    if (!categories.contains(todo.category)) {
                      categories.add(todo.category);
                    }
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              icon: const Icon(Icons.add, color: Colors.white, size: 40),
              label: const Text(
                'Add Task',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            );
          }
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
