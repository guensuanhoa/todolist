import 'package:todolist/base/bloc.dart';
import 'package:todolist/base/data_request.dart';
import 'package:todolist/home/home_state.dart';
import 'package:todolist/home/model/todo_item.dart';
import 'package:todolist/service/home_service.dart';

class HomeBloc extends Bloc<HomeState> {
  final HomeService _service = HomeService();

  @override
  void init() {
    loadTodoList();
  }

  @override
  HomeState get initialState => HomeState(
        id: HomeStateId.Loading,
      );

  void loadTodoList() {
    _service.getTodoList(
        dataRequest: DataRequest(onSuccess: (todoList) {
      if (todoList == null || todoList.isEmpty) {
        update(lastedState.copyWith(id: HomeStateId.Empty));
      } else {
        update(lastedState.copyWith(
          id: HomeStateId.Listing,
          todoList: todoList,
        ));
      }
    }, onFailure: (error) {
      update(lastedState.copyWith(id: HomeStateId.Error));
    }));
  }

  void onTodoItemCreated({TodoItem todoItem}) {
    List<TodoItem> cur = List<TodoItem>.from(lastedState.todoList);
    cur.add(todoItem);
    update(lastedState.copyWith(todoList: cur));
  }
}
