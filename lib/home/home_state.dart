enum HomeStateId { Loading, Listing, Error }

class HomeState {
  final HomeStateId id;

  HomeState({
    this.id,
  });

  HomeState copyWith({HomeStateId id}) => HomeState(
        id: id ?? this.id,
      );
}
