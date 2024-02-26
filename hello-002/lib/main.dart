import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

// App 화면의 전체적인 layout 을 구성하는 calss
//변화가 없는 text, 이미지 등을 표현하거나
//Statefulwidget을 포함하는 layout class 이다
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "안녕하세요",
      home: Scaffold(
        body: Row(
          children: [
            Text(
              "우리나라만세",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "대한민국만세",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "영어",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}

//화면에 구체적인 기능을 수행할 wedget 포함하는 class
//state 클래스를 생성하는 일을 수행
//state 클래스들을 관리하는 역할 수행

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  // State<StatefulWidget> createState() {return _Homepage();}
  State<StatefulWidget> createState() => _Homepage();
}

// 화면을 구현하는 구체적인 역할 수행
// 변화하는 text, 이미지 등을 표현한다.
// 언더바(_) 가 부착된 함수, 변수 ,클래스 등은 private 특성을 갖는다.
class _Homepage extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text("반갑습니다",
          style: TextStyle(
            fontSize: 50,
            color: Colors.blue,
          )),
    ));
  }
}
