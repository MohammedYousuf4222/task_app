import 'package:equatable/equatable.dart';

abstract class TaskEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateTask extends TaskEvent {
  final String name;
  final String description;
  final String assignedEmployee;

  CreateTask({required this.name, required this.description, required this.assignedEmployee});

  @override
  List<Object?> get props => [name, description, assignedEmployee];
}
