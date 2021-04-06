import 'package:cchess/modules/home/repository/home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_game_event.dart';
part 'new_game_state.dart';

class NewGameBloc extends Bloc<NewGameEvent, NewGameState> {
  NewGameBloc({
    required HomeRepository homeRepository
  }) : _homeRepository = homeRepository,
    super (const NewGameState.neutral());

  final HomeRepository _homeRepository;

  @override
  Stream<NewGameState> mapEventToState (NewGameEvent event) async* {
    if (event is NewGameRequest) {
      _homeRepository.requestNewGame(this);
      yield NewGameState.loading();
    } else if (event is NewGameSuccess) {
      yield NewGameState.success();
    } else if (event is NewGameFail) {
      yield NewGameState.fail(event.message);
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}