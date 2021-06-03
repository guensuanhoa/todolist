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

  void onTodoItemCreated({String content}) {
    List<TodoItem> cur = List<TodoItem>.from(lastedState.todoList ?? []);
    TodoItem newItem = TodoItem(
      id: cur.length,
      content: content,
      checked: false,
    );
    cur.add(newItem);
    update(lastedState.copyWith(id: HomeStateId.Listing, todoList: cur));
  }

  void onUserChangeItemValue({int index, bool value}) {
    List<TodoItem> cur = List<TodoItem>.from(lastedState.todoList ?? []);
    if (index >= 0 && index < cur.length) {
      TodoItem changedItem = cur[index];
      TodoItem newItem = TodoItem(
        id: changedItem.id,
        content: changedItem.content,
        checked: value,
      );
      cur[index] = newItem;
    }
    update(lastedState.copyWith(todoList: cur));
  }

  void onUserDeleteItem({int index}) {
    List<TodoItem> cur = List<TodoItem>.from(lastedState.todoList ?? []);
    if (index >= 0 && index < cur.length) {
      cur.removeAt(index);
    }
    update(
      lastedState.copyWith(
        id: cur.length > 0 ? HomeStateId.Listing : HomeStateId.Empty,
        todoList: cur,
      ),
    );
  }
}
