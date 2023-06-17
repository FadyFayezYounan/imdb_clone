import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String faiMessage;
  const Failure({required this.faiMessage});

  @override
  List<Object?> get props => [faiMessage];
}

class ServerFailure extends Failure {
  const ServerFailure({required String message}) : super(faiMessage: message);
}

class NetworkFailure extends Failure {
  const NetworkFailure({required String message}) : super(faiMessage: message);
}

class CachedFailure extends Failure {
  const CachedFailure({required String message}) : super(faiMessage: message);
}

class LocationFailure extends Failure {
  const LocationFailure({required String message}) : super(faiMessage: message);
}

// import 'package:equatable/equatable.dart';

// abstract class Failure extends Equatable {
//   final String faiMessage;
//   const Failure(this.faiMessage);

//   @override
//   List<Object?> get props => [faiMessage];
// }

// class ServerFailure extends Failure {
//   const ServerFailure(super.faiMessage);
// }

// class DatabaseFailure extends Failure {
//   const DatabaseFailure(super.faiMessage);
// }
