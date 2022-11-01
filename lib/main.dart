import 'package:flutter/material.dart';
import 'package:tugas_inherited_widget/inherited_widget.dart';

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
      home: InheritedCounter(child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CounterAppInherent'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            ValueListenableBuilder(
                valueListenable: InheritedCounter.of(context).count,
                builder: (context, count, child) {
                  return Text(
                    count.toString()
                  );
                }
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: (){
              InheritedCounter.of(context).min();
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          SizedBox(
            width: 5,
          ),
          FloatingActionButton(
            onPressed: (){
              InheritedCounter.of(context).plus();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      )
    );
  }
}
