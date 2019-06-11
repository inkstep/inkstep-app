import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:inkstep/models/card_model.dart';
import 'package:inkstep/models/user_model.dart';
import 'package:meta/meta.dart';

abstract class JourneysState extends Equatable {
  JourneysState([List<dynamic> props = const <dynamic>[]]) : super(props);
}

class JourneysNoUser extends JourneysState {
  @override
  String toString() => 'JourneysNoUser';
}

class JourneyError extends JourneysState {
  JourneyError({@required this.prev}) : super(<dynamic>[prev]);

  final JourneysState prev;

  @override
  String toString() => 'JourneysError { prev : $prev } ';
}

class JourneysWithUser extends JourneysState {
  JourneysWithUser({
    @required this.user,
    @required this.cards,
    @required this.firstTime,
  }) : super(<dynamic>[user, cards]);

  final User user;
  final List<Future<CardModel>> cards;
  final bool firstTime;

  @override
  String toString() => 'JourneysWithUser { user: $user, cards: ${cards?.length} }';
}
