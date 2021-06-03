import 'package:flutter/material.dart';
import 'package:todolist/home/model/todo_item.dart';

class TodoItemWidget extends StatelessWidget {
  final TodoItem item;

  const TodoItemWidget({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(item.content),
      ],
    );
  }
}
