import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String msg;

  const Failure(this.msg);

  @override
  List<Object?> get props => [msg];
}

class NetworkFailure extends Failure {
  const NetworkFailure({String msg = "No internet connection"}) : super(msg);
}
