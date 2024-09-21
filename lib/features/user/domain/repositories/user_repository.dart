import 'package:dartz/dartz.dart';
import 'package:male_app/core/errors/failure.dart';
import 'package:male_app/core/param/parameter.dart';
import 'package:male_app/features/user/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getUser({required UserParams params});
}
