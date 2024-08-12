import 'package:dartz/dartz.dart';
import 'flutter_local_storage_demo/core/error/exceptions.dart';
import 'flutter_local_storage_demo/core/error/failure.dart';
import 'flutter_local_storage_demo/tasks/data/data_sources/local/tasks_local_data_source.dart';
import 'flutter_local_storage_demo/tasks/data/models/tasks_model.dart';
import '../../domain/repositories/task_repository.dart';
import '../data_sources/local/tasks_local_data_source.dart';

class TasksRepositoryImpl implements TasksRepository {

  final TasksLocalDataSource tasksLocalDataSource;

  const TasksRepositoryImpl({
    required this.tasksLocalDataSource
  });

  @override
  Future<Either<Failure, Unit>> addTask(TasksModel task) async {
    try{
      final response = await tasksLocalDataSource.addTask(
          TasksModel(
              title: task.title,
              description: task.description,
              isDone: task.isDone)
      );
      return Right(response);
    } on ConnectionException {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<TasksModel>>> getAllTasks() async {
    try{
      final response = await tasksLocalDataSource.getAllTasks();
      return Right(response);
    } on NoDataException {
      return Left(NoDataFailure());
    }
  }

}