abstract class ExerciseEvent {}

class LoadExercises extends ExerciseEvent {}

class StartExercise extends ExerciseEvent {
  final int duration;

  StartExercise(this.duration);
}
