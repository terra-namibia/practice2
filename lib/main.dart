// ignore_for_file: unnecessary_string_interpolations, avoid_print

import 'package:flutter/material.dart';
import 'package:practice2/TestPage2.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
  print("起動したよ");
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
  static const String _url = 'https://flutter.dev';

  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.grey[300],
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

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

  void _launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  deleteCategory() {
    print("deleted!");
  }

  _delete() async {
    showDialog(
        context: context,
        builder: (BuildContext context) =>
            AlertDialog(title: const Text("削除してよろしいでしょうか"), actions: <Widget>[
              SimpleDialogOption(
                child: const Text("YES"),
                onPressed: () {
                  Navigator.pop(context, "YES");
                },
              ),
              SimpleDialogOption(
                child: const Text("NO"),
                onPressed: () {
                  Navigator.pop(context, "NO");
                },
              ),
            ])).then<void>((value) async {
      switch (value) {
        case "YES":
          await deleteCategory(); // データの削除を行う処理
          break;
        case "NO":
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: const [
          Icon(Icons.create),
          Text("初めてのタイトル"),
        ]),
        actions: <Widget>[
          IconButton(
            icon: const Icon(FontAwesomeIcons.trashCan),
            onPressed: _delete,
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(4),
                child: Column(
                  children: [
                    ElevatedButton(
                        onPressed: () => {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return TestPage2();
                              }))
                            },
                        child: const Text("Next page",
                            style: TextStyle(fontSize: 16))),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    if (_counter % 2 == 0)
                      const Text('偶数です',
                          style: TextStyle(fontSize: 20, color: Colors.red)),
                    if (_counter % 2 == 1)
                      const Text('奇数です',
                          style: TextStyle(fontSize: 20, color: Colors.red)),
                    Text('$_type',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.red)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
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
                        Icon(FontAwesomeIcons.globe, color: Colors.cyan)
                      ],
                    ),
                  ],
                )),
            Container(
              color: const Color.fromARGB(255, 240, 234, 209),
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: Column(children: [
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
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                      color: const Color.fromARGB(255, 238, 227, 177),
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(4),
                      child: Text(_lightIsOn ? '押せない OFF' : '押せない ON'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      color: const Color.fromARGB(255, 238, 227, 177),
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(4),
                      child: Text(_lightIsOn ? '押せない OFF' : '押せない ON'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedSwitcher(
                        duration: const Duration(seconds: 1),
                        child: _lightIsOn
                            ? const Icon(Icons.favorite, color: Colors.pink)
                            : const Text("なにもない")),
                    AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: _lightIsOn ? 56 : 20,
                        height: _lightIsOn ? 20 : 20,
                        padding: _lightIsOn
                            ? const EdgeInsets.all(2)
                            : const EdgeInsets.all(2),
                        margin: _lightIsOn
                            ? const EdgeInsets.all(2)
                            : const EdgeInsets.all(8),
                        color: _lightIsOn ? Colors.blue : Colors.grey),
                    AnimatedOpacity(
                        opacity: _lightIsOn ? 1.0 : 0.0,
                        duration: const Duration(seconds: 1),
                        child: Text(
                          "浮かぶ文字",
                          style: Theme.of(context).textTheme.headline5,
                        )),
                  ],
                ),
                AnimatedSwitcher(
                    duration: const Duration(seconds: 1),
                    child: _lightIsOn
                        ? Center(
                            child: Container(
                                padding: const EdgeInsets.all(10.0),
                                child: const SizedBox(
                                    width: 15,
                                    height: 15,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 3.0,
                                    ))))
                        : const Text("")),
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(4),
                  child: AnimatedAlign(
                      duration: const Duration(seconds: 1),
                      alignment: _lightIsOn
                          ? Alignment.bottomRight
                          : Alignment.topLeft,
                      child: SizedBox(
                          width: 16,
                          height: 16,
                          child: Container(color: Colors.green))),
                ),
                Container(
                  margin: const EdgeInsets.all(14),
                  child: AnimatedSize(
                      duration: const Duration(seconds: 1),
                      alignment: _lightIsOn
                          ? Alignment.topLeft
                          : Alignment.bottomRight,
                      child: SizedBox(
                          width: _lightIsOn ? 84 : 16,
                          height: _lightIsOn ? 84 : 16,
                          child: Container(
                              color: Color.fromARGB(255, 213, 120, 230)))),
                ),
              ]),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 8),
                alignment: Alignment.center,
                child: Container(
                  width: 200.0,
                  height: 80.0,
                  color: const Color.fromARGB(255, 250, 121, 112),
                  child: AnimatedAlign(
                    alignment:
                        selected ? Alignment.topRight : Alignment.bottomLeft,
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    child: const FlutterLogo(size: 20.0),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: raisedButtonStyle,
              onPressed: _launchURL,
              child: const Text('Show Flutter homepage'),
            ),

            // 不完全燃焼
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: ConstrainedBox(
                constraints:
                    const BoxConstraints.expand(height: 80, width: 240),
                child: PageView(
                  controller: _pageController,
                  children: <Widget>[
                    Container(
                      color: Colors.cyan,
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_pageController.hasClients) {
                              _pageController.animateToPage(
                                1,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          child: const Text('Next'),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.blue,
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_pageController.hasClients) {
                              _pageController.animateToPage(
                                0,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          child: const Text('Previous'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () =>
              {print("FloatingActionButtonが押されたよ"), _incrementCounter()},
          child: const Icon(Icons.timer)),
    );
  }
}
