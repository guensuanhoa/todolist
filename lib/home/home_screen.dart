import 'package:flutter/material.dart';
import 'package:todolist/base/provider.dart';
import 'package:todolist/home/home_bloc.dart';
import 'package:todolist/home/home_state.dart';
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
        title: Text("Todolist"),
      ),
      body: StreamBuilder<HomeState>(
        initialData: _bloc.initialState,
        stream: _bloc.stream,
        builder: (context, snapshot) {
          HomeStateId id = snapshot.data.id;
          switch (id) {
            case HomeStateId.Listing:
              return TodoListSection();
            case HomeStateId.Empty:
              return Center(child: Text("Ban chua co cong viec nao"));
            default:
              return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
