// ignore_for_file: use_key_in_widget_constructors


import 'package:aletha_health/bloc/exercise_bloc.dart';
import 'package:aletha_health/bloc/exercise_event.dart' show LoadExercises;
import 'package:aletha_health/bloc/exercise_state.dart';
import 'package:aletha_health/screens/exercise_detailed_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exercises')),
      body: BlocProvider(
        create: (_) => ExerciseBloc()..add(LoadExercises()),
        child: BlocBuilder<ExerciseBloc, ExerciseState>(
          builder: (context, state) {
            if (state is ExercisesLoaded) {
              return ListView.builder(
                itemCount: state.exercises.length,
                itemBuilder: (context, index) {
                  final exercise = state.exercises[index];
                  return ListTile(
                    title: Text(exercise.name),
                    subtitle: Text('${exercise.duration} seconds'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ExerciseDetailScreen(exercise: exercise),
                        ),
                      );
                    },
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
