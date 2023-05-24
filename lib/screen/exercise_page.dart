import 'dart:async';

import 'package:exercise_app/model/exercise_mod.dart';
import 'package:flutter/material.dart';

class ExercisePage extends StatefulWidget {
  ExercisePage({Key? key, this.second, this.ex}) : super(key: key);

  Exercises? ex;
  int? second;
  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  int startTime = 0;
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timer.tick - 1 == widget.second) {
        timer.cancel();
        Navigator.of(context).pop();
      } else {
        setState(() {
          startTime = timer.tick;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Image.network("${widget.ex!.gif}"),
            CircleAvatar(
                radius: 50,
                child: Text(
                  "$startTime",
                  style: TextStyle(fontSize: 50),
                ))
          ],
        ),
      ),
    );
  }
}
