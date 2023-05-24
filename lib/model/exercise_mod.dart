class ExerciseModel {
  ExerciseModel({
      this.exercises,});

  ExerciseModel.fromJson(dynamic json) {
    if (json['exercises'] != null) {
      exercises = [];
      json['exercises'].forEach((v) {
        exercises?.add(Exercises.fromJson(v));
      });
    }
  }
  List<Exercises>? exercises;
ExerciseModel copyWith({  List<Exercises>? exercises,
}) => ExerciseModel(  exercises: exercises ?? this.exercises,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (exercises != null) {
      map['exercises'] = exercises?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Exercises {
  Exercises({
      this.id, 
      this.title, 
      this.thumbnail, 
      this.gif, 
      this.seconds,});

  Exercises.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    gif = json['gif'];
    seconds = json['seconds'];
  }
  String? id;
  String? title;
  String? thumbnail;
  String? gif;
  String? seconds;
Exercises copyWith({  String? id,
  String? title,
  String? thumbnail,
  String? gif,
  String? seconds,
}) => Exercises(  id: id ?? this.id,
  title: title ?? this.title,
  thumbnail: thumbnail ?? this.thumbnail,
  gif: gif ?? this.gif,
  seconds: seconds ?? this.seconds,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['thumbnail'] = thumbnail;
    map['gif'] = gif;
    map['seconds'] = seconds;
    return map;
  }

}