import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';
import 'bloc/counter_bloc.dart';
import 'bloc/counter_event.dart';

class CounterScreen extends StatelessWidget {
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
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: IconButton(
              icon: Icon(Icons.add),
              color: Colors.redAccent,
              highlightColor: Colors.deepPurple,
              splashRadius: 70,
              splashColor: Colors.blue,
              iconSize: 50,
              onPressed: () {
                _counterBloc.add(CounterEvent.increment);
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: IconButton(
              icon: Icon(Icons.remove_circle_outline_sharp),
              splashRadius: 70,
              splashColor: Colors.blue,
              color: Colors.blue,
              highlightColor: Colors.brown,
              iconSize: 50,
              onPressed: () {
                _counterBloc.add(CounterEvent.decrement);
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: IconButton(
            icon: Icon(Icons.person_rounded),
            iconSize: 50,
            color: Colors.grey,
            onPressed: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                      value: BlocProvider.of<CounterBloc>(context),
                      child: Snd())))
            },
          ),
        )
      ]),
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

class Snd extends StatelessWidget {
  CounterBloc _counterBloc;

  @override
  Widget build(BuildContext context) {
    _counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
        // appbar design
        appBar: AppBar(
          title: Text('YOUNGMIN'), // 디바이스 위에 그려진ㄴ건 text클래스 써야함
          backgroundColor: Colors.amber[200],
          centerTitle: true,
          elevation: 0.0, // 앱바 밑부분의 테두리 높이로 이ㅣㄴ한 그림자없애줌 z축 0으로
        ),

        // body design
        backgroundColor: Colors.amber[300],
        body: Padding(
          // body속성 내 패딩모두 적용할꺼니까 감싸줌
          padding: EdgeInsets.fromLTRB(30, 40, 0, 0), // 적용할땐 엣지인셋으로!

          // column으로 하나의 자식ㄱ을 가지며 column은 다수의 자식을 가짐
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 기준으로 딱 맞ㄱ 정렬
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/또가스.jpg'),
                  radius: 60,
                  backgroundColor: Colors.amber[300],
                ),
              ), // ctrl space로 속성확인
              // children:<widget>[] 국룰
              // text style주기
              Divider(
                height: 60,
                color: Colors.grey,
                endIndent: 30, // 작대기 끝나는 거
              ),
              Text(
                'NAME',
                style: TextStyle(
                    // 컨트롤 누르고 textstyle에 마우스 올려봐
                    color: Colors.white,
                    letterSpacing: 2.0),
              ),
              // SizedBox(height: 10), 간격봐봐
              Text('YOUNGMIN',
                  style: TextStyle(
                      // 컨트롤 누르고 textstyle에 마우스 올려봐
                      color: Colors.white,
                      letterSpacing: 2.0,
                      fontSize: 28,
                      fontWeight: FontWeight.bold)),

              // SizedBox(height: 10),
              Text(
                'YOUNGMIN POWER LEVEL',
                style: TextStyle(
                    // 컨트롤 누르고 textstyle에 마우스 올려봐
                    color: Colors.white,
                    letterSpacing: 2.0),
              ),
              // SizedBox(height: 10),
              BlocBuilder<CounterBloc, int>(
                builder: (context, state) {
                  return Text(
                    '$state',
                    style: TextStyle(fontSize: 50.0),
                  );
                },
              ),

              SizedBox(height: 10),
              Row(children: <Widget>[
                Icon(Icons.menu_book),
                SizedBox(width: 20),
                Text(
                  '책 읽기',
                  style: TextStyle(
                      color: Colors.black87,
                      letterSpacing: 2.0,
                      fontSize: 16.0),
                )
              ]),

              SizedBox(height: 10),
              Row(children: <Widget>[
                Icon(Icons.check_circle_outline_outlined),
                SizedBox(width: 20),
                Text(
                  'Flutter 공부',
                  style: TextStyle(
                      color: Colors.black87,
                      letterSpacing: 2.0,
                      fontSize: 16.0),
                )
              ]),

              SizedBox(height: 10),
              Row(children: <Widget>[
                Icon(Icons.check_circle_outline_outlined),
                SizedBox(width: 20),
                Text(
                  '빨래',
                  style: TextStyle(
                      color: Colors.black87,
                      letterSpacing: 2.0,
                      fontSize: 16.0),
                )
              ]),

              SizedBox(height: 10),
              Row(children: <Widget>[
                Icon(Icons.radio_button_unchecked_outlined),
                SizedBox(width: 20),
                Text(
                  'PPT연습',
                  style: TextStyle(
                      color: Colors.black87,
                      letterSpacing: 2.0,
                      fontSize: 16.0),
                )
              ]),

              SizedBox(height: 30),
              Center(
                child: CircleAvatar(
                    backgroundImage: AssetImage('assets/또가스.jpg'),
                    backgroundColor: Colors.amber[200],
                    radius: 30),
              ),
            ],
          ),
        ));
  }
}
