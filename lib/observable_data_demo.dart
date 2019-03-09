import 'package:flutter/material.dart';
import 'package:observable_data/flexible_data/list/mutable_list_flexible_data.dart';
import 'package:observable_data/flexible_data/mutable_flexible_data.dart';

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

class _MyHomePageState extends State<MyHomePage> {
  MutableFlexibleData<int> flexibleData = new MutableFlexibleData(0);
  MutableListFlexibleData<int> listFlexibleData =
      new MutableListFlexibleData([0]);

  int _counter = 0;
  String _description;
  String _list;

  @override
  void initState() {
    super.initState();

    flexibleData.filter((value) {
      return value % 2 == 0;
    }).map((value) {
      return "Count of clicks: " + value.toString();
    }).subscribe((value) {
      setState(() {
        _description = value;
      });
    });

    listFlexibleData.forEachFilter((value) {
      return value % 2 == 0;
    }).subscribe((value) {
      setState(() {
        _list = value.toString();
      });
    });
  }

  void _incrementCounter() {
    flexibleData.value = ++_counter;
    listFlexibleData.add(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _description,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              _list,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
