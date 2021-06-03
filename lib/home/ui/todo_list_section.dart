import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todolist/home/model/todo_item.dart';
import 'package:todolist/home/ui/todo_item_widget.dart';

class TodoListSection extends StatefulWidget {
  final List<TodoItem> todoList;

  const TodoListSection({
    Key key,
    this.todoList,
  }) : super(key: key);

  @override
  _TodoListSectionState createState() => _TodoListSectionState();
}

class _TodoListSectionState extends State<TodoListSection> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.todoList.length,
      itemBuilder: (context, index) => Container(
        margin: EdgeInsets.all(8),
        child: RaisedButton(
          onPressed: () {
            log('_TodoListSectionState.build: item click $index');
          },
          child: TodoItemWidget(
            item: widget.todoList[index],
          ),
        ),
      ),
    );
  }
}
