import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';
import 'bloc/counter_event.dart';
import 'countScreen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLOC PATTERN YOUNGMIN'),
        backgroundColor: Colors.amber[200],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          TextButton(
            child: Text('Count App'),
            onPressed: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                      value: BlocProvider.of<CounterBloc>(context),
                      child: CounterScreen())))
            },
          ),
          ElevatedButton(
              child: Text('Practice'),
              onPressed: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                            value: BlocProvider.of<CounterBloc>(context),
                            child: CounterScreen())))
                  })
        ],
      ),
    );
  }
}
