import 'package:equatable/equatable.dart';

class ProductionCountryEntity extends Equatable {
  const ProductionCountryEntity({
    required this.iso31661,
    required this.name,
  });

  final String iso31661;
  final String name;

  @override
  List<Object?> get props => [
        iso31661,
        name,
      ];
}
