import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';
import 'bloc/counter_event.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MyHomePage에 main.dart에서 정의한 counterBloc에 대한 의존성주업
    CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      key: context.read<CounterBloc>().scaffoldKey,
      appBar: AppBar(
        title: Text('BLOC COUNTER TEST YOUNGMIN'),
        backgroundColor: Colors.amber[200],
        centerTitle: true,
        elevation: 0.0,
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 80),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                // event를 bloc에 보낸다
                // add가 호출될 때마다 mapEventToState가 불려진다
                onPressed: () => _counterBloc.add(CounterEvent.increment),
                child: Icon(Icons.add),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () => _counterBloc.add(CounterEvent.decrement),
              child: Icon(Icons.remove),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('이만큼 눌렀습니다.'),
            // state갱신됏을 때 위젯렌다링
            BlocBuilder<CounterBloc, int>(
              builder: (cotnext, state) {
                print(state);
                return Text(
                  '$state',
                  style: TextStyle(fontSize: 50.0),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
