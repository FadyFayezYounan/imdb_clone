import 'package:movies_app/features/movie_details/domain/entities/movie_details_entity/production_company_entity.dart';

class ProductionCompanyModel extends ProductionCompanyEntity {
  const ProductionCompanyModel({
    required super.id,
    required super.logoPath,
    required super.name,
    required super.originCountry,
  });
  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) =>
      ProductionCompanyModel(
        id: json["id"],
        logoPath: json["logo_path"],
        name: json["name"],
        originCountry: json["origin_country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "logo_path": logoPath,
        "name": name,
        "origin_country": originCountry,
      };
}
