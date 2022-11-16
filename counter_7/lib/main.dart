import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  final String title = 'Program Counter';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool showVisible = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if((_counter - 1 == -1)){
        _counter = 0;
      }else{
        _counter--;
      }
    });
  }

  void _showButton() {
    setState(() {
      if (_counter == 0) {
        showVisible = false;
      } else {
        showVisible = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
        drawer: const drawer(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if( _counter % 2 == 0)
                  const Text(
                    'GENAP',
                    style:  TextStyle(color: Colors.red),
                  )
                else
                  const Text(
                    'GANJIL',
                    style:  TextStyle(color: Colors.blue),
                  ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: showVisible,
              child: FloatingActionButton(
                onPressed: () {
                  _decrementCounter();
                  _showButton();
                },
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                _incrementCounter();
                _showButton();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      )
    );
  }
}
