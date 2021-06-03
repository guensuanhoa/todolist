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
  TextEditingController _textEditingController = new TextEditingController();

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
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextField(
                  controller: _textEditingController,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(
                        color: Colors.teal,
                      ),
                    ),
                    helperText: 'Nhập nội dung công việc',
                    labelText: 'Nội dung công việc',
                    prefixIcon: const Icon(
                      Icons.task,
                      color: Colors.green,
                    ),
                    prefixText: ' ',
                  ),
                  autofocus: true,
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: RaisedButton(
                    onPressed: () {
                      String content = _textEditingController.text?.trim();
                      if (content?.isNotEmpty == true) {
                        Navigator.of(context).pop(content);
                      }
                    },
                    child: Text("Tạo"),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
