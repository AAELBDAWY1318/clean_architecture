import 'package:male_app/core/database/api/api_consumer.dart';
import 'package:male_app/core/database/api/end_points.dart';
import 'package:male_app/core/param/parameter.dart';
import 'package:male_app/features/user/data/models/user_model.dart';

class UserRemoteDataSource {
  final ApiConsumer api;

  UserRemoteDataSource({required this.api});

  Future<UserModel> getUser({required UserParams userParams}) async {
    final response = await api
        .get("${EndPoints.baseUrl}${EndPoints.users}/${userParams.id}");
    return UserModel.fromJson(json: response);
  }
}
