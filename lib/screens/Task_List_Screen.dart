import 'package:dubai_task/bloc/Bloc_State.dart';
import 'package:dubai_task/bloc/Task_Bloc.dart';
import 'package:dubai_task/screens/Task_Creation_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 117, 69, 229),
          child: Icon(Icons.add, color: Colors.white,),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TaskCreationScreen()),
            );
          },
        ),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 117, 69, 229),
          title: const Text('Task List', style: TextStyle(
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.w600
          ),),
          centerTitle: true,
          ),
        body: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if (state is TaskCreated && state.tasks.isNotEmpty) {
              return ListView.builder(
                itemCount: state.tasks.length,
                itemBuilder: (context, index) {
                  final task = state.tasks[index];
                  return Column(
                    children: [
                      ExpansionTile(
                        leading: Icon(Icons.person, color: Colors.green,),
                        title: Text(task.name,
                        style: const TextStyle(
                                fontSize: 21
                              ),
                        ),subtitle: Text(task.assignedEmployee,
                        style: const TextStyle(
                                fontSize: 16
                              ),
                        ),
                        children: [
                          SizedBox
                          (
                            height: 40,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(task.description,
                              style: const TextStyle(
                                fontSize: 16
                              ),)))
                        ],
                        ),
                    ],
                  );
                },
              );
            } else { 
              return Center(child: Text('No tasks available'));
            }
          },
        ),
      ),
    );
  }
}
