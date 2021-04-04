part of 'new_game_bloc.dart';

enum NewGameStatus { neutral, loading, success, fail }

class NewGameState extends Equatable {
  const NewGameState._({
    this.status = NewGameStatus.neutral,
    this.message = "",
  });

  const NewGameState.neutral() : this._();

  const NewGameState.loading()
      : this._(status: NewGameStatus.loading);

  const NewGameState.success()
      : this._(status: NewGameStatus.success);

  const NewGameState.fail(String message)
      : this._(status: NewGameStatus.fail, message: message);

  final NewGameStatus status;
  final String message;

  @override
  List<Object> get props => [status, message];
}