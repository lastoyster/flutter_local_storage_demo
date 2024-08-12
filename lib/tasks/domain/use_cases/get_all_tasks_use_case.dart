import 'package:dartz/dartz.dart';
import 'flutter_local_storage_demo/core/error/failure.dart';
import 'flutter_local_storage_demo/core/use_case/base_use_case.dart';
import 'flutter_local_storage_demo/tasks/data/models/tasks_model.dart';
import '../repositories/task_repository.dart';

class GetAllTasksUseCase extends BaseUseCase<List<TasksModel>, DefaultParams>{

  final TasksRepository taskRepository;

  GetAllTasksUseCase({required this.taskRepository});

  @override
  Future<Either<Failure, List<TasksModel>>> call(DefaultParams param) async {
    return await taskRepository.getAllTasks();
  }

}