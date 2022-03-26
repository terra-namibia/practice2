import 'package:flutter/material.dart';
import 'package:practice2/TestPage2.dart';

void main() {
  runApp(const MyApp());
  print("ボタンがおされたよ");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _type = "偶数";

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter % 4 == 0) {
        _type = "4で割り切れます";
      } else {
        _type = "4で割り切れません";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Icon(Icons.create),
          Text("初めてのタイトル"),
        ]),
      ),
      drawer: Drawer(child: Center(child: Text("Drawer"))),
      body: Column(
        children: [
          Text("data1"),
          Text("data2"),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
          ),
          if (_counter % 2 == 0)
            Text('偶数です', style: TextStyle(fontSize: 20, color: Colors.red)),
          if (_counter % 2 == 1)
            Text('奇数です', style: TextStyle(fontSize: 20, color: Colors.red)),
          Text('$_type', style: TextStyle(fontSize: 20, color: Colors.red)),
          TextButton(
            onPressed: () => {print("updateボタンがおされたよ")},
            child: Text("update"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.favorite,
                color: Colors.pink,
                size: 24.0,
              ),
              Icon(
                Icons.audiotrack,
                color: Colors.green,
                size: 30.0,
              ),
              Icon(
                Icons.beach_access,
                color: Colors.blue,
                size: 36.0,
              ),
            ],
          ),
          TextButton(
              onPressed: () => {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return TestPage2();
                    }))
                  },
              child: Text("進む", style: TextStyle(fontSize: 80))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () =>
              {print("FloatingActionButtonが押されたよ"), _incrementCounter()},
          child: Icon(Icons.timer)),
    );
  }
}
