
import 'package:flutter/material.dart';
import 'package:todolist/home/model/todo_item.dart';
import 'package:todolist/home/ui/todo_item_widget.dart';

class TodoListSection extends StatefulWidget {
  final List<TodoItem> todoList;
  final Function(int index, bool value) onItemChanged;
  final Function(int index) onDeleted;

  const TodoListSection({
    Key key,
    this.todoList,
    this.onItemChanged,
    this.onDeleted,
  }) : super(key: key);

  @override
  _TodoListSectionState createState() => _TodoListSectionState();
}

class _TodoListSectionState extends State<TodoListSection> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.todoList.length,
      itemBuilder: (context, index) {
        var item = widget.todoList[index];
        return Container(
          margin: EdgeInsets.all(8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
                side: BorderSide(width: 0.5, color: Colors.blueAccent)),
            onPressed: () {
              _onItemChanged(index, item);
            },
            child: TodoItemWidget(
              item: item,
              onChanged: () {
                _onItemChanged(index, item);
              },
              onDeleted: () {
                if (widget.onDeleted != null) {
                  widget.onDeleted(index);
                }
              },
            ),
          ),
        );
      },
    );
  }

  void _onItemChanged(int index, TodoItem item) {
    if (widget.onItemChanged != null) {
      widget.onItemChanged(index, !item.checked);
    }
  }
}
