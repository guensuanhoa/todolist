import 'package:todolist/add_item/add_item_state.dart';
import 'package:todolist/base/bloc.dart';

class AddItemBloc extends Bloc<AddItemState> {
  @override
  void init() {
    // TODO: implement init
  }

  @override
  AddItemState get initialState => AddItemState(
        id: AddItemStateId.Idle,
      );
}
