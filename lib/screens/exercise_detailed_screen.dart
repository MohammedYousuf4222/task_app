
import 'package:aletha_health/bloc/exercise_bloc.dart';
import 'package:aletha_health/bloc/exercise_event.dart';
import 'package:aletha_health/bloc/exercise_state.dart' show ExerciseCompleted, ExerciseInProgress, ExerciseState;
import 'package:aletha_health/model/exercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ExerciseDetailScreen extends StatelessWidget {
  final Exercise exercise;

  ExerciseDetailScreen({required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(exercise.name)),
      body: BlocProvider(
        create: (_) => ExerciseBloc(),
        child: BlocBuilder<ExerciseBloc, ExerciseState>(
          builder: (context, state) {
            if (state is ExerciseInProgress) {
              return Center(
                child: Text('Time remaining: ${state.remainingTime}s'),
              );
            } else if (state is ExerciseCompleted) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Exercise Completed!'),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Back to Home'),
                    ),
                  ],
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Description: ${exercise.description}'),
                    Text('Duration: ${exercise.duration} seconds'),
                    Text('Difficulty: ${exercise.difficulty}'),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ExerciseBloc>().add(StartExercise(exercise.duration));
                      },
                      child: Text('Start Exercise'),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
