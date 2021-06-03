import 'package:flutter/material.dart';
import 'package:todolist/base/provider.dart';
import 'package:todolist/home/home_bloc.dart';
import 'package:todolist/home/home_state.dart';

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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Todolist"),
      ),
      body: StreamBuilder<HomeState>(
        initialData: _bloc.initialState,
        stream: _bloc.stream,
        builder: (context, snapshot) {
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
