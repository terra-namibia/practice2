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
  bool selected = false;
  bool _lightIsOn = false;

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AnimatedSwitcher(
                  duration: Duration(seconds: 1),
                  child: _lightIsOn
                      ? Icon(Icons.favorite, color: Colors.pink)
                      : Text("なにもない")),
              AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  width: _lightIsOn ? 15 : 5,
                  height: _lightIsOn ? 5 : 15,
                  padding: _lightIsOn ? EdgeInsets.all(0) : EdgeInsets.all(5),
                  margin: _lightIsOn ? EdgeInsets.all(0) : EdgeInsets.all(5),
                  color: _lightIsOn ? Colors.blue : Colors.grey),
              AnimatedOpacity(
                  opacity: _lightIsOn ? 1.0 : 0.0,
                  duration: Duration(seconds: 1),
                  child: Text(
                    "浮かぶ文字",
                    style: Theme.of(context).textTheme.headline5,
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.lightbulb_outline,
              color: _lightIsOn ? Colors.yellow.shade600 : Colors.black,
              size: 60,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _lightIsOn = !_lightIsOn;
                  });
                },
                child: Container(
                  color: Colors.yellow.shade600,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(4),
                  child: Text(_lightIsOn ? '押せる OFF' : '押せる ON'),
                ),
              ),
              Container(
                color: Color.fromARGB(255, 238, 227, 177),
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(4),
                child: Text(_lightIsOn ? '押せない OFF' : '押せない ON'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                color: Color.fromARGB(255, 238, 227, 177),
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(4),
                child: Text(_lightIsOn ? '押せない OFF' : '押せない ON'),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(4),
            child: AnimatedAlign(
                duration: const Duration(seconds: 1),
                alignment:
                    _lightIsOn ? Alignment.topLeft : Alignment.bottomRight,
                child: SizedBox(
                    width: 10,
                    height: 10,
                    child: Container(color: Colors.green))),
          ),
          Container(
            margin: const EdgeInsets.all(4),
            child: AnimatedSize(
                duration: const Duration(seconds: 1),
                alignment:
                    _lightIsOn ? Alignment.topLeft : Alignment.bottomRight,
                child: SizedBox(
                    width: _lightIsOn ? 5 : 15,
                    height: _lightIsOn ? 5 : 15,
                    child: Container(color: Colors.purple))),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },
            child: Center(
              child: Container(
                width: 150.0,
                height: 150.0,
                color: Color.fromARGB(255, 250, 121, 112),
                child: AnimatedAlign(
                  alignment:
                      selected ? Alignment.topRight : Alignment.bottomLeft,
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastOutSlowIn,
                  child: const FlutterLogo(size: 30.0),
                ),
              ),
            ),
          ),
          TextButton(
              onPressed: () => {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return TestPage2();
                    }))
                  },
              child: Text("進む", style: TextStyle(fontSize: 30))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () =>
              {print("FloatingActionButtonが押されたよ"), _incrementCounter()},
          child: Icon(Icons.timer)),
    );
  }
}
