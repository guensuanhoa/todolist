enum AddItemStateId { Idle, Submit }

class AddItemState {
  final AddItemStateId id;

  AddItemState({this.id});

  AddItemState copyWith({
    AddItemStateId id,
  }) =>
      AddItemState(
        id: id ?? this.id,
      );
}
