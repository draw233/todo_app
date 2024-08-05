import 'package:flutter/material.dart';

class TodoTitle extends StatelessWidget {
  final String taskName;

  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final VoidCallback deteteFucntion;

  const TodoTitle(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deteteFucntion});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Container(
          padding: EdgeInsets.all(24.0),
          child: Row(
            children: [
              // checkBox
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.red,
              ),
              // taskName
              Text(
                taskName,
                style: TextStyle(
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              MaterialButton(
                onPressed: deteteFucntion,
                child: Text("del"),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(12))),
    );
  }
}
