import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task_model.dart';
import 'dart:convert';

abstract class TaskEvent {}

class LoadTasksEvent extends TaskEvent {}

class AddTaskEvent extends TaskEvent {
  final Task task;
  AddTaskEvent(this.task);
}

class ToggleTaskStatusEvent extends TaskEvent {
  final String taskId;
  ToggleTaskStatusEvent(this.taskId);
}

abstract class TaskState {}

class TaskInitial extends TaskState {}
class TaskLoading extends TaskState {}
class TaskLoaded extends TaskState {
  final List<Task> tasks;
  TaskLoaded(this.tasks);
}

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<LoadTasksEvent>((event, emit) async {
      emit(TaskLoading());
      final prefs = await SharedPreferences.getInstance();
      final tasksJson = prefs.getStringList('tasks');
      if (tasksJson != null) {
        final tasks = tasksJson.map((e) => Task.fromJson(jsonDecode(e))).toList();
        emit(TaskLoaded(tasks));
      } else {
        // Mock default tasks
        final mockTasks = [
          Task(id: '1', title: 'Finalize Q4 Revenue Strategy', description: 'Synthesize data...', dueDate: DateTime.now(), priority: 'High', status: 'In Progress', project: 'Growth & Expansion'),
          Task(id: '2', title: 'Review Figma File', description: '', dueDate: DateTime.now().add(const Duration(hours: 2)), priority: 'Medium', status: 'Pending', project: 'Design'),
        ];
        await prefs.setStringList('tasks', mockTasks.map((e) => jsonEncode(e.toJson())).toList());
        emit(TaskLoaded(mockTasks));
      }
    });

    on<AddTaskEvent>((event, emit) async {
      if (state is TaskLoaded) {
        final currentTasks = (state as TaskLoaded).tasks;
        final updatedTasks = List<Task>.from(currentTasks)..add(event.task);

        final prefs = await SharedPreferences.getInstance();
        await prefs.setStringList('tasks', updatedTasks.map((e) => jsonEncode(e.toJson())).toList());

        emit(TaskLoaded(updatedTasks));
      }
    });

    on<ToggleTaskStatusEvent>((event, emit) async {
      if (state is TaskLoaded) {
        final currentTasks = (state as TaskLoaded).tasks;
        final updatedTasks = currentTasks.map((task) {
          if (task.id == event.taskId) {
            return Task(
              id: task.id,
              title: task.title,
              description: task.description,
              dueDate: task.dueDate,
              priority: task.priority,
              status: task.status == 'Completed' ? 'Pending' : 'Completed',
              project: task.project,
              isAiSuggested: task.isAiSuggested,
            );
          }
          return task;
        }).toList();

        final prefs = await SharedPreferences.getInstance();
        await prefs.setStringList('tasks', updatedTasks.map((e) => jsonEncode(e.toJson())).toList());

        emit(TaskLoaded(updatedTasks));
      }
    });
  }
}
