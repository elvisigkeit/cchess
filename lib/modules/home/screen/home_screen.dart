import 'package:cchess/modules/home/bloc/new_game_bloc.dart';
import 'package:cchess/modules/home/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen() : homeRepository = HomeRepository();

  final HomeRepository homeRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: homeRepository,
      child: BlocProvider(
        create: (_) => NewGameBloc(homeRepository: homeRepository),
        child: Scaffold(
          body: Row(
            children: [
              Expanded(child: Container(color: Colors.black12), flex: 1,),
              Container(width: 800, child: Chess(),),
              Expanded(child: Container(color: Colors.black12), flex: 1,),
            ],
          ),
        ),
      ),
    );
  }
}

class Chess extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Container(), flex: 2,),
        Expanded(
          child: HomeTitle(),
          flex: 1,
        ),
        Expanded(
          child: BlocListener<NewGameBloc, NewGameState>(
            listener: (context, state) {
              if(state.status == NewGameStatus.success) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(content: Text('New Game Success')),
                  );
              }
              if(state.status == NewGameStatus.fail) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(content: Text('Failure: ' + state.message)),
                  );
              }
            },
            child: HomeCard(),
          ),
          flex: 1,
        ),
        Expanded(child: Container(), flex: 2,),
      ],
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(), flex: 1,),
        Expanded(child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: Container(), flex: 1),
              Expanded(child: Text("Welcome Guest", textAlign: TextAlign.center,), flex: 1,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: BlocBuilder<NewGameBloc, NewGameState>(
                    buildWhen: (previous, current) => previous.status != current.status,
                    builder: (context, state) {
                      return state.status == NewGameStatus.loading ?
                        LinearProgressIndicator()
                        : ElevatedButton(
                          onPressed: () =>
                              context.read<NewGameBloc>().add(NewGameRequest()),
                          child: Text("PLAY"),
                      );
                    }
                  ),
                ),
                flex: 2,
              ),
              Expanded(child: Container(), flex: 1),
            ],),
        ), flex: 3,),
        Expanded(child: Container(), flex: 1,),
    ],);
  }
}

class HomeTitle extends StatelessWidget {
  const HomeTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(), flex: 1,),
        Expanded(child: Container(
            child: Text("CCHESS",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Orbitron',
                fontWeight: FontWeight.w900,
                color: Theme.of(context).accentColor.withOpacity(0.8),
                fontSize: 90,
              ),
            )
        ), flex: 3,),
        Expanded(child: Container(), flex: 1,),
      ],);
  }
}