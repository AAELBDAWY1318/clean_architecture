import 'package:bloc/bloc.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:male_app/core/database/api/dio_consumer.dart';
import 'package:male_app/core/database/cach/cach_helper.dart';
import 'package:male_app/core/network_info/network_info.dart';
import 'package:male_app/core/param/parameter.dart';
import 'package:male_app/features/user/data/data_source/cach_user_data.dart';
import 'package:male_app/features/user/data/data_source/user_remote_data.dart';
import 'package:male_app/features/user/data/repositories/user_repository_impl.dart';
import 'package:male_app/features/user/domain/use_case/get_user.dart';
import 'package:male_app/features/user/presentation/cubit/user_states.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(super.initialState);

  getFailureOrUser(int id) async {
    emit(GetUserLoading());
    final res = await GetUser(
            repository: UserRepositoryImpl(
                networkInfo: NetworkInfoImpl(
                    dataConnectionChecker: DataConnectionChecker()),
                userRemoteDataSource:
                    UserRemoteDataSource(api: DioConsumer(dio: Dio())),
                userCachedDataSource:
                    UserCachedDataSource(cacheHelper: CacheHelper())))
        .call(params: UserParams(id: id.toString()));

    res.fold((l) {
      emit(GetUserFailure(errMessage: l.errMessage));
    }, (r) {
      emit(GetUserSuccessfully(user: r));
    });
  }
}
