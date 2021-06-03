import 'dart:async';

import 'package:rxdart/rxdart.dart';

abstract class Bloc<S> {
  BehaviorSubject<S> _controller;

  Stream<S> get stream => _controller.stream;

  S get initialState;

  S get lastedState => _controller.value;

  void init();

  Bloc() {
    _controller = BehaviorSubject<S>.seeded(initialState);
  }

  void update(S newState) {
    if (!_controller.isClosed) {
      _controller.add(newState);
    }
  }

  void dispose() {
    _controller.close();
  }
}
