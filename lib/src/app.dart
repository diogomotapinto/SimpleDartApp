import 'package:flutter/material.dart';
import 'models/image_models.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _counter = 0;
  Future<ImageModel> imageModel;

  void addNumber() {
    imageModel = fetchImage(_counter.toString());
    imageModel.then((onValue) => print(onValue.title));

    print(_counter);
    setState(() {
      _counter += 1;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Code Sample for material.Scaffold',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Counter(counter: _counter),
        appBar: AppBar(
          title: Text('Simple App'),
          backgroundColor: Colors.blueAccent,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => addNumber(),
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}

class Counter extends StatelessWidget {
  final counter;

  Counter({@required this.counter});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "$counter",
        style: TextStyle(
            color: Colors.teal, fontSize: 50.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
