import 'package:todolist/home/model/todo_item.dart';

enum HomeStateId { Loading, Listing, Empty, Error }

class HomeState {
  final HomeStateId id;
  final List<TodoItem> todoList;

  HomeState({
    this.id,
    this.todoList,
  });

  HomeState copyWith({
    HomeStateId id,
    List<TodoItem> todoList,
  }) =>
      HomeState(
        id: id ?? this.id,
        todoList: todoList ?? this.todoList,
      );
}
