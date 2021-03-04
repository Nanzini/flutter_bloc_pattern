import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';
import 'bloc/counter_event.dart';

class MyHomePage extends StatelessWidget {
  CounterBloc _counterBloc;
  @override
  Widget build(BuildContext context) {
    _counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      key: context.read<CounterBloc>().scaffoldKey,
      appBar: AppBar(
        title: Text('BLOC COUNTER TEST YOUNGMIN'), // 디바이스 위에 그려진ㄴ건 text클래스 써야함
        backgroundColor: Colors.amber[200],
        centerTitle: true,
        elevation: 0.0, // 앱바 밑부분의 테두리 높이로 이ㅣㄴ한 그림자없애줌 z축 0으로
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 80),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
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
            BlocBuilder<CounterBloc, int>(
              builder: (context, state) {
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
