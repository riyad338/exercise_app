import 'dart:convert';

import 'package:exercise_app/model/exercise_mod.dart';

import 'package:exercise_app/screen/details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ExerciseModel? exerciseModel;

  var uriLink =
      "https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json?fbclid=IwAR1s0681ePa8Rr6o_MM04G4Hnpp8MlweW4DKO-SOawqKbIB2nlR98cBzpT8";

  Future<ExerciseModel> fetchHomeData() async {
    var responce = await http.get(Uri.parse(uriLink));
    var data = jsonDecode(responce.body);

    exerciseModel = ExerciseModel.fromJson(data);
    return exerciseModel!;
  }

  @override
  void initState() {
    fetchHomeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text("Fit Body"),
      ),
      body: Container(
          width: double.infinity,
          child: FutureBuilder<ExerciseModel>(
            future: fetchHomeData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Text("Something is wrong");
              } else if (snapshot.data == null) {
                return Text("snapshot data are null");
              }
              return ListView.builder(
                itemCount: exerciseModel!.exercises!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final data = exerciseModel!.exercises![index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailsPage(
                                n: data,
                              )));
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(bottom: 12),
                      height: 150,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              "${data.thumbnail}",
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${data.title}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                height: 60,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                      Colors.black,
                                      Colors.black,
                                      Colors.black54,
                                      Colors.black12,
                                      Colors.transparent
                                    ])),
                              ))
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          )),
    );
  }
}
