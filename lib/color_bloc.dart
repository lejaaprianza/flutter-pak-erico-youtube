import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum ColorEvent { to_amber, to_light_blue }

//untuk yang pake library
class ColorBloc extends Bloc<ColorEvent, Color> {
  Color _color = Colors.amber;
  @override
  Color get initialState => Colors.amber;

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    _color = (event == ColorEvent.to_amber) ? Colors.amber : Colors.lightBlue;
    yield _color;
  }

  // void dispatch(ColorEvent to_amber) {}
}

//untuk yang tanpa library
// class ColorBloc {
//   Color _color = Colors.amber;

//   StreamController<ColorEvent> _eventController =
//       StreamController<ColorEvent>();
//   StreamSink<ColorEvent> get eventSink => _eventController.sink;
//   StreamController<Color> _stateController = StreamController<Color>();
//   StreamSink<Color> get _stateSink => _stateController.sink;
//   Stream<Color> get stateStream => _stateController.stream;

//   void _mapEventToState(ColorEvent colorEvent) {
//     if (colorEvent == ColorEvent.to_amber)
//       _color = Colors.amber;
//     else
//       _color = Colors.lightBlue;

//     _stateSink.add(_color);
//   }

//   ColorBloc() {
//     _eventController.stream.listen(_mapEventToState);
//   }

//   void dispose() {
//     _eventController.close();
//     _stateController.close();
//   }
// }
