import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int id;
  final String title;
  final String body;

  // ignore: prefer_const_constructors_in_immutables
  Post({required this.id, required this.title, required this.body});

  @override
  List<Object?> get props => [id, title, body];
}
