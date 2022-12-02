import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MultiThread extends StatefulWidget {
  MultiThread({super.key});
  bool isLoading = true;
  Timer? timer;

  @override
  State<MultiThread> createState() => _MultiThreadState();
}

class _MultiThreadState extends State<MultiThread> {
  Future<void> testCompute() async {
    widget.timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      print(timer.tick);
    });
    // compute(calculateAll, null).then((value) {
    //   _changeNumber(value);
    //   timer?.cancel();
    // });
    // await comuputeSample();
    // await comuputeSample();
    // await Future.wait([
    //   computeWithAwait(),
    //   computeWithAwait(),
    //   computeWithAwait(),
    //   computeWithAwait(),
    // ]);

    calculateAll(5);
    calculateAll(5);
    calculateAll(5);
    calculateAll(5);

    // await compute(calculateAll, null);
    // await compute(calculateAll, null);
    // await compute(calculateAll, null);
    // await compute(calculateAll, null);

    // firebase.init();
    // await comuputeSample();
    // await comuputeSample();
    // await comuputeSample();
    // await compute(calculateAll, null);
    // changeAll();
    await Future.delayed(Duration(milliseconds: 500));
    _changeLoading();
    widget.timer?.cancel();
    print("tasks finished");
  }

  void _changeLoading() {
    setState(() {
      widget.isLoading = !widget.isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          testCompute();
        },
      ),
      appBar: AppBar(
        title: Text('thread test'),
      ),
      body: Center(
        child: Column(
          children: [
            widget.isLoading ? CircularProgressIndicator() : SizedBox()
          ],
        ),
      ),
    );
  }
}

Future<void> computeWithAwait() async {
  await compute(calculateAll, null);
}

void calculateAll(int? value) {
  int _count = 0;
  for (var i = 0; i < 1000000000; i++) {
    _count += i;
  }
}
