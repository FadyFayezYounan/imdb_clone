import 'package:movies_app/features/movie_details/domain/entities/movie_details_entity/production_country_entity.dart';

class ProductionCountryModel extends ProductionCountryEntity {
  const ProductionCountryModel({
    required super.iso31661,
    required super.name,
  });
  factory ProductionCountryModel.fromJson(Map<String, dynamic> json) =>
      ProductionCountryModel(
        iso31661: json["iso_3166_1"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661,
        "name": name,
      };
}
