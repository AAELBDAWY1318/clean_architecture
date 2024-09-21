import 'package:dartz/dartz.dart';
import 'package:male_app/core/errors/failure.dart';
import 'package:male_app/core/param/parameter.dart';
import 'package:male_app/features/user/domain/entities/user_entity.dart';
import 'package:male_app/features/user/domain/repositories/user_repository.dart';

class GetUser {
  final UserRepository repository;

  GetUser({required this.repository});
  Future<Either<Failure, UserEntity>> call({required UserParams params}) {
    return repository.getUser(params: params);
  }
}
