import 'package:male_app/core/database/api/end_points.dart';
import 'package:male_app/features/user/domain/entities/sub_entities/geo_sub_entity.dart';

class GeoModel extends GeoEntity {
  GeoModel({required super.lat, required super.lng});

  factory GeoModel.fromJson({required Map<String, dynamic> json}) {
    return GeoModel(lat: json[UserApiKey.lat], lng: json[UserApiKey.lng]);
  }

  Map<String, dynamic> toJson() {
    return {
      UserApiKey.lat: lat,
      UserApiKey.lng: lng,
    };
  }
}
