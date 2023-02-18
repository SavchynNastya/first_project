import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

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
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(name: "Anastasiia", surname: "Savchyn"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required String name, required String surname}) : _name=name, _surname=surname;

  String _name;
  String _surname;

  set name (n) => _name = n;
  String get name => _name;

  set surname (s) => _surname = s;
  String get surname => _surname;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String _time;

  @override
  void initState(){
    _time = _formatTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer timer) => _getTime());
    super.initState();
  }

  void _getTime(){
    DateTime current = DateTime.now();
    String formattedTime = _formatTime(current);
    setState(() {
      _time = formattedTime;
    });
  }

  String _formatTime(DateTime time){
    return DateFormat('hh:mm:ss').format(time);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.name} ${widget.surname}'),
      ),
      body: Center(
        child: Text(_time)
      ),
    );
  }
}
