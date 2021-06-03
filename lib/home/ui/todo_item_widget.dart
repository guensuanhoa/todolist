import 'package:flutter/material.dart';
import 'package:todolist/home/model/todo_item.dart';

class TodoItemWidget extends StatelessWidget {
  final TodoItem item;
  final VoidCallback onChanged;
  final VoidCallback onDeleted;

  const TodoItemWidget({
    Key key,
    this.item,
    this.onChanged,
    this.onDeleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Checkbox(
            value: item.checked ?? false,
            onChanged: (value) {
              if (onChanged != null) {
                onChanged();
              }
            },
          ),
          Expanded(
            child: Text(
              item.content,
              style: TextStyle(color: Colors.black),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onDeleted != null) {
                onDeleted();
              }
            },
            child: Icon(
              Icons.delete,
              size: 24,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
