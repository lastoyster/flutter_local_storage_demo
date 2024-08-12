import 'package:dartz/dartz.dart';
import 'flutter_local_storage/core/error/failure.dart';
import 'flutter_local_storage/tasks/data/models/tasks_model.dart';

abstract class TasksRepository {
  Future<Either<Failure, List<TasksModel>>> getAllTasks();
  Future<Either<Failure, Unit>> addTask(TasksModel task);
}