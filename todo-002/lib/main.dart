import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:todollist/model/todo.dart';
import 'package:todollist/service/todo_service.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoHome(),
    );
  }
}

class TodoHome extends StatefulWidget {
  const TodoHome({
    super.key,
  });

//state<> 클래스를 생성하여 화면을 그리는 객체로 만들기

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

//state<>화면에 변화되는 변수를 사용하거나
//여러가지 interactine 한 화면을 구현하는 widget calss
class _TodoHomeState extends State<TodoHome> {
  /// textfield 에 ID 를 부착하기 위한 state
  final todoInputController = TextEditingController();
  String todo = "";
  getTodo(String todo) {
    return Todo(
      id: const Uuid().v4(),
      sdate: DateFormat("yyyy-MM-dd").format(DateTime.now()),
      stime: DateFormat("HH:ss:mm").format(DateTime.now()),
      edate: "",
      etime: "",
      content: todo,
      complete: false,
    );
    // return todoDto;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("TODO List"),
        ),
        bottomSheet: bottomSheet(context),
        body: todoListBody(context));
  }

  Widget todoListBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          FutureBuilder(
            //FutureBuilder
            //데이터베이스에서 가져온 List 데이터를 화면에
            //표현하기 위한 빌더(생성자 만들기 함수)
            //selectAll()한 데이터를 future속성에 주입
            //내부에서 가공되어 다시 데이터를 전달
            future: TodoService().selectAll(),
            builder: (context, snapshot) {
              var todoList = snapshot.data as List<Todo>;

              /// todoList snapshot data를 가지고 실제 list 를 화면에 그리는 도구
              return ListView.builder(
                shrinkWrap: true,
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return Text(todoList[index].content);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: todoInputController,
              onChanged: (value) => setState(() => todo = value),
              decoration: InputDecoration(
                  hintText: "할일을 입력하세요",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  prefix: const SizedBox(
                    width: 5,
                  ),
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => {todoInputController.clear()},
                        icon: const Icon(Icons.clear),
                      ),
                      IconButton(
                        onPressed: () async {
                          var snackBar = SnackBar(content: Text("$Text(todo)"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          var todoDto = getTodo(todo);

                          ///SW 키보드 감추기
                          FocusScope.of(context).unfocus();
                          await TodoService().insert(todoDto);
                          todoInputController.clear();
                        },
                        icon: const Icon(Icons.send),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
