import 'package:movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/usecase.dart';
import 'package:movies_app/features/search/domain/repositories/search_local_repository.dart';

class DeleteSearchHistoryUseCase extends UseCase<bool, NoParams> {
  final SearchLocalRepository searchLocalRepository;

  DeleteSearchHistoryUseCase({required this.searchLocalRepository});
  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await searchLocalRepository.deleteSearchHistory();
  }
}
