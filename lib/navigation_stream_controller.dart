import 'dart:async';

import 'package:flutter_app/constants.dart';
import 'package:rxdart/rxdart.dart';


class NavigationStreamController {
  final _streamBehaviorSubject = BehaviorSubject<NavigationEvent>();


  Stream<NavigationEvent> get navigationStream => _streamBehaviorSubject.stream;

  void navigateTo(NavigationEvent event) {
    _streamBehaviorSubject.sink.add(event);
  }

  void dispose() {
    _streamBehaviorSubject.close();
  }
}
