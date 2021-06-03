import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todolist/add_item/add_item_screen.dart';
import 'package:todolist/base/provider.dart';
import 'package:todolist/home/home_bloc.dart';
import 'package:todolist/home/home_state.dart';
import 'package:todolist/home/model/todo_item.dart';
import 'package:todolist/home/ui/todo_list_section.dart';

class HomeScreen extends StatefulWidget {
  static Widget newInstance() => BlocProvider<HomeBloc>(
        builder: (context) => HomeBloc(),
        child: HomeScreen(),
      );

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Danh sách công việc"),
      ),
      body: StreamBuilder<HomeState>(
        initialData: _bloc.initialState,
        stream: _bloc.stream,
        builder: (context, snapshot) {
          HomeStateId id = snapshot.data.id;
          log('_HomeScreenState.build: $id');
          switch (id) {
            case HomeStateId.Listing:
              return TodoListSection(todoList: snapshot.data.todoList);
            case HomeStateId.Empty:
              return Center(child: Text("Bạn chưa có công việc nào"));
            default:
              return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          TodoItem todoItem = await AddItemScreen.show(context: context);

          log('_HomeScreenState.createTodoItem: $todoItem');
          if (todoItem != null) {
            _bloc.onTodoItemCreated(todoItem: todoItem);
          }
        },
        child: const Icon(Icons.add_circle_outline),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
