import 'package:dubai_task/models/Bloc_Model.dart';
import 'package:equatable/equatable.dart';

abstract class TaskState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TaskInitial extends TaskState {}

class TaskCreated extends TaskState {
  final List<Task> tasks;

  TaskCreated(this.tasks);

  @override
  List<Object?> get props => [tasks];
}
