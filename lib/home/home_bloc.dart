import 'package:todolist/base/bloc.dart';
import 'package:todolist/home/home_state.dart';

class HomeBloc extends Bloc<HomeState> {
  @override
  void init() {
    loadTodoList();
  }

  @override
  HomeState get initialState => HomeState(
        id: HomeStateId.Loading,
      );

  void loadTodoList() {

  }
}
