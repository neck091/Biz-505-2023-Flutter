import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //변수의 late 초기화 flutter(dart)에서는 변수를 반드시 초기화를 해야하는 원칙이 있음.
  //변수를 선언만 하면 문법상 오류 발생.
  //이 코드에서는 _timer 는 이후 if() 명령문에서 조건에 따라 초기화를 늦게 시킬예정.
  //처음 변수를 선언할 때 초기값을 지정하지 않음
  //flutter(dart)에서는 이 코드는 변수 초기화 원칙에 위배
  //이럴 때 late라는 키워드를 부착하여 아래 코드에서 변수를 꼭 초기화 할테니 일단 보류해달라는 의미.
  late Timer _timer;
  static const int wantTimer = 10;
  int _count = wantTimer;
  bool _timerRun = false;

  void _onPressed() {
    setState(() {
      _timerRun = !_timerRun;
    });
    if (_timerRun) {
      _timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          setState(() => _count--);
          if (_count < 1) {
            _count = wantTimer;
            _timerRun = false;
            timer.cancel();
          }
        },
      );
    } else {
      _timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: TextButton(
        onPressed: _onPressed,
        child: Center(
            child: Text(
          "$_count",
          style: TextStyle(
            fontSize: 80,
            fontWeight: FontWeight.w900,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 1
              ..color = Colors.white,
          ),
        )),
      ),
    );
  }
}
