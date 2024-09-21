import 'package:male_app/core/database/api/end_points.dart';
import 'package:male_app/features/user/data/models/sub_models/geo_model.dart';
import 'package:male_app/features/user/domain/entities/sub_entities/address_sub_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel(
      {required super.street,
      required super.suite,
      required super.city,
      required super.zipcode,
      required super.geoEntity});

  factory AddressModel.fromJson({required Map<String, dynamic> json}) {
    return AddressModel(
        street: json[UserApiKey.street],
        suite: json[UserApiKey.suite],
        city: json[UserApiKey.city],
        zipcode: json[UserApiKey.zipcode],
        geoEntity: GeoModel.fromJson(json: json[UserApiKey.geo]));
  }

  Map<String, dynamic> toJson() {
    return {
      UserApiKey.street: street,
      UserApiKey.suite: suite,
      UserApiKey.city: city,
      UserApiKey.zipcode: zipcode,
      UserApiKey.geo: geoEntity,
    };
  }
}
