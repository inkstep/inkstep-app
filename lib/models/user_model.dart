import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  User({@required this.name, @required this.email})
      : super(<dynamic>[name, email]);

  User.fromJson(Map<String, dynamic> json)
      : name = json['user_name'],
        email = json['user_email'];

  final String name;
  final String email;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'user_name': name, 'user_email': email};
  }

  @override
  String toString() => 'User { name: $name, email: $email }';
}