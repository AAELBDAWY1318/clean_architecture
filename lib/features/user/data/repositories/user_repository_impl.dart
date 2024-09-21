import 'package:dartz/dartz.dart';
import 'package:male_app/core/errors/exceptions.dart';
import 'package:male_app/core/errors/failure.dart';
import 'package:male_app/core/network_info/network_info.dart';
import 'package:male_app/core/param/parameter.dart';
import 'package:male_app/features/user/data/data_source/cach_user_data.dart';
import 'package:male_app/features/user/data/data_source/user_remote_data.dart';
import 'package:male_app/features/user/domain/entities/user_entity.dart';
import 'package:male_app/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final NetworkInfo networkInfo;
  final UserRemoteDataSource userRemoteDataSource;
  final UserCachedDataSource userCachedDataSource;

  UserRepositoryImpl(
      {required this.networkInfo,
      required this.userRemoteDataSource,
      required this.userCachedDataSource});
  @override
  Future<Either<Failure, UserEntity>> getUser(
      {required UserParams params}) async {
    if (await networkInfo.isconnect!) {
      try {
        final response = await userRemoteDataSource.getUser(userParams: params);
        userCachedDataSource.cacheUser(response);
        return Right(response);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        final response = await userCachedDataSource.getLastUser();
        return Right(response);
      } on CacheExeption catch (e) {
        return Left(Failure(errMessage: e.errorMessage));
      }
    }
  }
}
