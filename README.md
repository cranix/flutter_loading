# flutter_loading

easy use loading 

## Getting Started

1. mixin LoadingStateMixin 
2. target loadingContainer
3. action loading(future)

## example
```
import 'package:flutter/material.dart';
import 'package:flutter_loading/flutter_loading.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with LoadingStateMixin {
  int _counter = 0;

  void _incrementCounter() async {
    int tick = await loading(_action());
    setState(() {
      _counter += tick;
    });
  }

  Future<int> _action() async {
    await Future.delayed(Duration(milliseconds: 1000));
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return loadingContainer(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

```