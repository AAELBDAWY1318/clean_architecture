import 'package:male_app/core/database/api/end_points.dart';

class CompanyModel {
  final String name;
  final String catchPhrase;
  final String bs;

  CompanyModel(
      {required this.name, required this.catchPhrase, required this.bs});

  factory CompanyModel.fromJson({required Map<String, dynamic> json}) {
    return CompanyModel(
        name: json[UserApiKey.name],
        catchPhrase: json[UserApiKey.catchPhrase],
        bs: json[UserApiKey.bs]);
  }

  Map<String, dynamic> toJson() {
    return {
      UserApiKey.name: name,
      UserApiKey.catchPhrase: catchPhrase,
      UserApiKey.bs: bs,
    };
  }
}
