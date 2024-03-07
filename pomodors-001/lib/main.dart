import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timer/dash_page.dart';
import 'package:timer/home_page.dart';
import 'package:timer/setting_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _pageIndex = 1;
  int wantTimer = 20;

  void onChangeSetting(String value) {
    if (value.length > 3) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(value)));
    }
  }

  //타입의 변수 선언
  //flutter dart 에서 변수를 선언할 때 final, const
  //키워드가 있으면 변수의 타입을 명시하지 않아도 됨.
  //단 이 때 반드시 값이 초기화 되어야 함

  final _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/tomato.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: PageView(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          onPageChanged: (value) => setState(() => _pageIndex = value),
          children: [
            const HomePage(),
            const DashPage(),
            SettingPage(onChange: onChangeSetting),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _pageIndex,
          onTap: (value) {
            _pageIndex = value;
            _pageController.animateToPage(
              value,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
            setState(() => {});
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: "dashboard",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "settings",
            ),
          ],
        ),
      ),
    );
  }
}
