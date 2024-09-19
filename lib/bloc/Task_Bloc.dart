import 'package:dubai_task/bloc/Bloc_Event.dart';
import 'package:dubai_task/models/Bloc_Model.dart';
import 'package:dubai_task/bloc/Bloc_State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class TaskBloc extends Bloc<TaskEvent, TaskState> {
  List<Task> tasks = [];

  TaskBloc() : super(TaskInitial()) {
    on<CreateTask>((event, emit) {
      tasks.add(Task(
        name: event.name,
        description: event.description,
        assignedEmployee: event.assignedEmployee,
      ));
      emit(TaskCreated(tasks.toList()));
    });
  }
}
