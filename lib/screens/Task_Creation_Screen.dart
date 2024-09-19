import 'package:dubai_task/bloc/Bloc_Event.dart';
import 'package:dubai_task/bloc/Task_Bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskCreationScreen extends StatefulWidget {
  @override
  _TaskCreationScreenState createState() => _TaskCreationScreenState();
}

class _TaskCreationScreenState extends State<TaskCreationScreen> {
  final _formKey = GlobalKey<FormState>();
  String _taskName = '';
  String _taskDescription = '';
  String? _selectedEmployee;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Task', style: TextStyle(
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.w600
          ),),
          backgroundColor: const Color.fromARGB(255, 117, 69, 229),
          ),
        body: Padding(
          padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
          child: SizedBox(
            height: 350,
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: 
                        InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Task Name'),
                        validator: (value) =>
                            value!.isEmpty ? 'Task Name is required' : null,
                        onSaved: (value) => _taskName = value!,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Task Description'),
                        onSaved: (value) => _taskDescription = value!,
                      ),
                       const SizedBox(
                        height: 20,
                      ),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder()
                        ),
                        hint: Text("Employee"),
                        validator: (value) =>
                            value == null ? 'Employee is required' : null,
                        value: _selectedEmployee,
                        items: ['Employee 1', 'Employee 2', 'Employee 3']
                            .map((String employee) {
                          return DropdownMenuItem(
                              value: employee, child: Text(employee));
                        }).toList(),
                        onChanged: (value) =>
                            setState(() => _selectedEmployee = value!),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 350,
                        child: ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor:WidgetStatePropertyAll(Color.fromARGB(255, 117, 69, 229),) 
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              context.read<TaskBloc>().add(CreateTask(
                                  name: _taskName,
                                  description: _taskDescription,
                                  assignedEmployee: _selectedEmployee!));
                              const snackBar = SnackBar(
                                content: Text('Task Succesfully Created'),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              Navigator.pop(context);
                            }
                          },
                          child: Text('Create Task', style: TextStyle(
                            color: Colors.white,
                            fontSize: 16
                          ),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
