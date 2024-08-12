import 'package:dartz/dartz.dart';
import 'flutter_local_storage_demo/core/error/failure.dart';
import 'flutter_local_storage_demo/core/use_case/base_use_case.dart';
import 'flutter_local_storage_demo/tasks/data/models/tasks_model.dart';
import 'flutter_local_storage_demo/tasks/domain/repositories/task_repository.dart';

class AddTaskUseCase extends BaseUseCase<Unit, TasksModel>{

  final TasksRepository taskRepository;

  AddTaskUseCase({required this.taskRepository});

  @override
  Future<Either<Failure, Unit>> call(TasksModel param) async {
    return await taskRepository.addTask(param);
  }

}