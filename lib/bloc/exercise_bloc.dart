// ignore_for_file: override_on_non_overriding_member

import 'dart:async';
import 'package:aletha_health/model/exercise.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'exercise_event.dart';
import 'exercise_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  ExerciseBloc() : super(ExerciseInitial());

  @override
  Stream<ExerciseState> mapEventToState(ExerciseEvent event) async* {
    if (event is LoadExercises) {
      yield* _mapLoadExercisesToState();
    } else if (event is StartExercise) {
      yield* _mapStartExerciseToState(event);
    }
  }

  Stream<ExerciseState> _mapLoadExercisesToState() async* {
    try {
      final response = await http.get(Uri.parse('https://68252ec20f0188d7e72c394f.mockapi.io/dev/workouts'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final exercises = data.map((e) => Exercise.fromJson(e)).toList();
        yield ExercisesLoaded(exercises);
      } else {
        // Handle error
      }
    } catch (_) {
      // Handle error
    }
  }

  Stream<ExerciseState> _mapStartExerciseToState(StartExercise event) async* {
    for (int i = event.duration; i >= 0; i--) {
      yield ExerciseInProgress(i);
      await Future.delayed(Duration(seconds: 1));
    }
    yield ExerciseCompleted();
  }
}
