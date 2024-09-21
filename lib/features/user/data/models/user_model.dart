import 'package:male_app/core/database/api/end_points.dart';
import 'package:male_app/features/user/data/models/sub_models/address_model.dart';
import 'package:male_app/features/user/data/models/sub_models/company_model.dart';
import 'package:male_app/features/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final int id;
  final String username;
  final String website;
  final CompanyModel companyModel;
  UserModel(
      {required super.name,
      required super.email,
      required super.phone,
      required super.address,
      required this.id,
      required this.username,
      required this.website,
      required this.companyModel});

  factory UserModel.fromJson({required Map<String, dynamic> json}) {
    return UserModel(
      address: AddressModel.fromJson(json: json[UserApiKey.address]),
      companyModel: CompanyModel.fromJson(json: json[UserApiKey.company]),
      email: json[UserApiKey.email],
      id: json[UserApiKey.id],
      name: json[UserApiKey.name],
      phone: json[UserApiKey.phone],
      username: json[UserApiKey.username],
      website: json[UserApiKey.website],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      UserApiKey.id: id,
      UserApiKey.name: name,
      UserApiKey.email: email,
      UserApiKey.phone: phone,
      UserApiKey.username: username,
      UserApiKey.website: website,
      UserApiKey.company: companyModel,
      UserApiKey.address: address,
    };
  }
}
