import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const String name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Progress Indicator')),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 30),
          Text('Circular Progress Indicator'),
          SizedBox(height: 10),
          CircularProgressIndicator(
            strokeWidth: 4,
            backgroundColor: Colors.black12,
          ),
          SizedBox(height: 20),
          Text('Circular Progress Indicator Controlado'),
          SizedBox(height: 10),
          _ControlledProgressIndicator(),
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(Duration(milliseconds: 300), (value) {
        return (value * 2) / 100; //valores desde 0.1...1.0
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) {
        final progressValue = snapshot.data ?? 0;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(value: progressValue, strokeWidth: 2),
              SizedBox(width: 20),
              Expanded(child: LinearProgressIndicator(value: progressValue)),
            ],
          ),
        );
      },
    );
  }
}
