import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:cchess/modules/home/bloc/new_game_bloc.dart';

class HomeRepository {
  Future<void> requestNewGame(NewGameBloc newGameBloc) async {
    http.Response response;

    //Request test
    try {
      response =
      await http.get(Uri.http('jsonplaceholder.typicode.com', 'albums/1'));
    } catch(e) {
      newGameBloc.add(NewGameFail(e.toString()));
      return;
    }

    if (response.statusCode == 200) {
      newGameBloc.add(NewGameSuccess());
    } else {
      newGameBloc.add(NewGameFail(response.body));
    }
  }
}