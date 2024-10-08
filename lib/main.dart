import 'package:dubai_task/bloc/Task_Bloc.dart';
import 'package:dubai_task/screens/Landing.dart';
import 'package:dubai_task/screens/Task_Creation_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task Assignment System',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: LandingScreen(),
        routes: {
          '/create-task': (context) => TaskCreationScreen(),
        },
      ),
    );
  }
}
