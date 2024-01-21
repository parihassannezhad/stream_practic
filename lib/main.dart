import 'dart:async';
import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textStyle = const TextStyle(fontSize: 17, fontWeight: FontWeight.w500);
  final ButtonStyle =
      const TextStyle(fontSize: 21, fontWeight: FontWeight.w700);
  StreamController<int> streamController = StreamController<int>();
  int? randomValue;
  final Random randomNumber = Random();

  @override
  void initState() {
    // TODO: implement initState
    streamController.stream.listen((event) {
      setState(() {
        randomValue = event;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    streamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              randomValue.toString() ?? '',
              style: textStyle,
            ),
            const SizedBox(
              height: 40,
            ),
            TextButton(
                onPressed: () async {
                  getRandomValue().then((value) => streamController.sink.add(value));
                },
                child: Text(
                  'add data',
                  style: ButtonStyle,
                ))
          ],
        ),
      ),
    ));
  }
  Future<int> getRandomValue()async{
    await Future.delayed(Duration(seconds: 2));
int i=0;
while(i>=10){}
    return randomNumber.nextInt(100);

  }


}
