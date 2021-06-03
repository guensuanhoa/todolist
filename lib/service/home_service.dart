import 'package:todolist/base/data_request.dart';
import 'package:todolist/home/model/todo_item.dart';
import 'package:todolist/home/model/todo_list.dart';

class HomeService {
  static const dummyTodoList = '''
  {
    "data": 
    [
      {
          "id" : 1,
          "content": "Thuc day som"
      },
      {
          "id" : 2,
          "content": "Thuc day som"
      }
    ]
   }''';

  void getTodoList({DataRequest<List<TodoItem>> dataRequest}) {
    TodoList todoListRes = todoListFromJson(dummyTodoList);
    dataRequest?.onSuccess(todoListRes?.data);
  }
}