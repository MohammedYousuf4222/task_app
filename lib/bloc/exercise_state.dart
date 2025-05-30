import 'package:aletha_health/model/exercise.dart';

abstract class ExerciseState {}

class ExerciseInitial extends ExerciseState {}

class ExercisesLoaded extends ExerciseState {
  final List<Exercise> exercises;

  ExercisesLoaded(this.exercises);
}

class ExerciseInProgress extends ExerciseState {
  final int remainingTime;

  ExerciseInProgress(this.remainingTime);
}

class ExerciseCompleted extends ExerciseState {}
