import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class CounterBloc extends Bloc<int, int> {
  @override
  // TODO: implement initialState
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(int event) async* {
    // TODO: implement mapEventToState
    // throw UnimplementedError();
    yield event;
  }
}
