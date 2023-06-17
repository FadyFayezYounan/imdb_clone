import 'package:equatable/equatable.dart';

class CastEntity extends Equatable {
  const CastEntity({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    required this.creditId,
    this.order,
    this.department,
    this.job,
  });

  final bool adult;
  final int? gender;
  final int id;
  final String? knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final int? castId;
  final String? character;
  final String creditId;
  final int? order;
  final String? department;
  final String? job;

  @override
  List<Object?> get props => [
        adult,
        gender,
        id,
        knownForDepartment,
        name,
        originalName,
        popularity,
        profilePath,
        castId,
        character,
        creditId,
        order,
        department,
        job,
      ];
}

enum Department {
  acting,
  crew,
  sound,
  production,
  writing,
  art,
  costumeAndMakeUp,
  visualEffects,
  directing,
  editing,
  camera,
  lighting,
}

final departmentValues = EnumValues({
  "Acting": Department.acting,
  "Art": Department.art,
  "Camera": Department.camera,
  "Costume & Make-Up": Department.costumeAndMakeUp,
  "Crew": Department.crew,
  "Directing": Department.directing,
  "Editing": Department.editing,
  "Lighting": Department.lighting,
  "Production": Department.production,
  "Sound": Department.sound,
  "Visual Effects": Department.visualEffects,
  "Writing": Department.writing
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
// import 'package:equatable/equatable.dart';

// class CastEntity extends Equatable {
//   const CastEntity({
//     required this.adult,
//     required this.gender,
//     required this.id,
//     required this.knownForDepartment,
//     required this.name,
//     required this.originalName,
//     required this.popularity,
//     this.profilePath,
//     this.castId,
//     this.character,
//     required this.creditId,
//     this.order,
//     this.department,
//     this.job,
//   });

//   final bool adult;
//   final int? gender;
//   final int id;
//   final Department? knownForDepartment;
//   final String name;
//   final String originalName;
//   final double popularity;
//   final String? profilePath;
//   final int? castId;
//   final String? character;
//   final String creditId;
//   final int? order;
//   final Department? department;
//   final String? job;

//   @override
//   List<Object?> get props => [
//         adult,
//         gender,
//         id,
//         knownForDepartment,
//         name,
//         originalName,
//         popularity,
//         profilePath,
//         castId,
//         character,
//         creditId,
//         order,
//         department,
//         job,
//       ];
// }

// enum Department {
//   acting,
//   crew,
//   sound,
//   production,
//   writing,
//   art,
//   costumeAndMakeUp,
//   visualEffects,
//   directing,
//   editing,
//   camera,
//   lighting,
// }

// final departmentValues = EnumValues({
//   "Acting": Department.acting,
//   "Art": Department.art,
//   "Camera": Department.camera,
//   "Costume & Make-Up": Department.costumeAndMakeUp,
//   "Crew": Department.crew,
//   "Directing": Department.directing,
//   "Editing": Department.editing,
//   "Lighting": Department.lighting,
//   "Production": Department.production,
//   "Sound": Department.sound,
//   "Visual Effects": Department.visualEffects,
//   "Writing": Department.writing
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
