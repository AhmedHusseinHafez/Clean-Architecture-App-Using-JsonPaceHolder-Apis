import 'package:equatable/equatable.dart';

abstract class Faliure extends Equatable {}

class OfflineFaliure extends Faliure {
  @override
  List<Object?> get props => [];
}

class ServerFaliure extends Faliure {
  @override
  List<Object?> get props => [];
}

class EmptyCacheFaliure extends Faliure {
  @override
  List<Object?> get props => [];
}
