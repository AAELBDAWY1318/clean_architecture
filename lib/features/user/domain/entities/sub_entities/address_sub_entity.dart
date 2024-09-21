import 'package:male_app/features/user/domain/entities/sub_entities/geo_sub_entity.dart';

class AddressEntity {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeoEntity geoEntity;

  AddressEntity(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode,
      required this.geoEntity});
}
