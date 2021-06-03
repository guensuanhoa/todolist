import 'dart:convert';

import 'package:todolist/home/model/todo_item.dart';

TodoList todoListFromJson(String str) => TodoList.fromJson(json.decode(str));

String todoListToJson(TodoList data) => json.encode(data.toJson());

class TodoList {
  TodoList({
    this.data,
  });

  final List<TodoItem> data;

  factory TodoList.fromJson(Map<String, dynamic> json) => TodoList(
        data:
            List<TodoItem>.from(json["data"].map((x) => TodoItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
