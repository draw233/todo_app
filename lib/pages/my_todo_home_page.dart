import 'package:flutter/material.dart';
import 'package:todo_app/util/dialog_box.dart';

import '../util/todo_title.dart';

class MyTodoHomePage extends StatefulWidget {
  const MyTodoHomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyTodoHomePageState();
  }
}

class _MyTodoHomePageState extends State<MyTodoHomePage> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _data = [
    {"taskName": "Make tutorial", "taskCompleted": false},
    {"taskName": "Do Exercise", "taskCompleted": true},
  ];

  void _checkBoxChange(bool? value, int index) {
    setState(() {
      _data[index]["taskCompleted"] = !_data[index]["taskCompleted"];
    });
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        _controller.text = "";
        return DialogBox(
          controller: _controller,
          onCancel: () => Navigator.of(context).pop(),
          onSave: saveTask,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red[200],
        appBar: AppBar(
          title: Center(child: Text("TO DO")),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: _data.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> d = _data[index];
              return TodoTitle(
                taskName: d["taskName"],
                taskCompleted: d["taskCompleted"],
                onChanged: (p) => _checkBoxChange(p, index),
                deteteFucntion: () => deleteTask(index),
              );
            }));
  }

  void saveTask() {
    setState(() {
      _data.add(
        {"taskName": _controller.text, "taskCompleted": false},
      );
    });
    Navigator.of(context).pop();
  }

  deleteTask(int index) {
    setState(() {
      _data.removeAt(index);
    });
  }
}
