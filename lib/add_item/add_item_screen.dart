import 'package:flutter/material.dart';
import 'package:todolist/add_item/add_item_bloc.dart';
import 'package:todolist/add_item/add_item_state.dart';
import 'package:todolist/base/provider.dart';

class AddItemScreen extends StatefulWidget {
  static Future<dynamic> show({BuildContext context}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddItemScreen.newInstance(),
      ),
    );
  }

  static Widget newInstance() => BlocProvider<AddItemBloc>(
        builder: (context) => AddItemBloc(),
        child: AddItemScreen(),
      );

  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  AddItemBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = BlocProvider.of<AddItemBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tạo công việc"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: StreamBuilder<AddItemState>(
        initialData: _bloc.initialState,
        stream: _bloc.stream,
        builder: (context, snapshot) {
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
