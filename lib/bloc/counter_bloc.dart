import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'counter_event.dart';

// bloc쓰기 위한 필수 블럭상속받기 event와 state의 타입
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc({int state}) : super(state = 0);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final snackBar1 = SnackBar(content: Text('0이하로는 떨어지지 않아요'));
  final snackBar2 = SnackBar(content: Text('5이상 오르지 않아요'));
  // 인풋으로 오는 이벤트를 결과값인 state로 매핑시키느 ㄴ메서드
  /// Must be implemented when a class extends [Bloc].
  /// [mapEventToState] is called whenever an [event] is [add]ed
  /// and is responsible for converting that [event] into a new [state].
  /// [mapEventToState] can `yield` zero, one, or multiple states for an event.
  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    // stream so async* keyword.
    switch (event) {
      case CounterEvent.increment:
        if (state >= 5) {
          scaffoldKey.currentState.hideCurrentSnackBar();
          scaffoldKey.currentState.showSnackBar(snackBar2);
          yield state;
        } else
          yield state + 1;
        break;
      case CounterEvent.decrement:
        if (state <= 0) {
          scaffoldKey.currentState.hideCurrentSnackBar();
          scaffoldKey.currentState.showSnackBar(snackBar1);
          yield state;
        } else
          yield state - 1;
        break;
    }
  }
}
