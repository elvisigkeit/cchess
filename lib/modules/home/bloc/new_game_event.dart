part of 'new_game_bloc.dart';

abstract class NewGameEvent extends Equatable {
  const NewGameEvent();

  @override
  List<Object> get props => [];
}

class NewGameFail extends NewGameEvent {
  const NewGameFail(this.status);

  final String status;

  @override
  List<Object> get props => [status];
}

class NewGameSuccess extends NewGameEvent {}

class NewGameRequest extends NewGameEvent {}