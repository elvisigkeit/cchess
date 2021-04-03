import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(child: Container(color: Colors.black12), flex: 1,),
          Container(width: 800, child: Chess(),),
          Expanded(child: Container(color: Colors.black12), flex: 1,),
        ],
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
          child: Row(
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
            ],),
          flex: 1,
        ),
        Expanded(
          child: Row(
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
                        child: ElevatedButton(
                          onPressed: ()=>debugPrint("oie"),
                          child: Text("PLAY"),
                        ),
                      ),
                      flex: 2,
                    ),
                    Expanded(child: Container(), flex: 1),
                  ],),
              ), flex: 3,),
              Expanded(child: Container(), flex: 1,),
          ],),
          flex: 1,
        ),
        Expanded(child: Container(), flex: 2,),
      ],
    );
  }
}