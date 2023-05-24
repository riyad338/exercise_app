import 'package:exercise_app/model/exercise_mod.dart';

import 'package:exercise_app/screen/exercise_page.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key, this.n}) : super(key: key);

  Exercises? n;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int second = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Image.network(
              "${widget.n!.thumbnail}",
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                SleekCircularSlider(
                  min: 0,
                  max: 50,
                  initialValue: 5,
                  onChange: (double value) {
                    setState(() {
                      second = value.toInt();
                    });
                  },
                  onChangeStart: (double startValue) {},
                  onChangeEnd: (double endValue) {},
                  innerWidget: (double value) {
                    return Center(
                        child: Text(
                      "${second.toStringAsFixed(0)}",
                      style: TextStyle(fontSize: 40, color: Colors.black),
                    ));
                  },
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ExercisePage(
                                ex: widget.n,
                                second: second,
                              )));
                    },
                    child: Text(
                      "Start Exercise",
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
