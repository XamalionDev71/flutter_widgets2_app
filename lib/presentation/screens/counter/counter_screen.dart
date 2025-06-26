import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  static const name = 'counter screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter Screen')),
      body: Center(child: Text('Valor: 10',style: TextStyle(fontSize: 24),)),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
