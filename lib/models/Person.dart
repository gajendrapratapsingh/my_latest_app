import 'package:hive/hive.dart';


@HiveType(typeId: 1)
class Person extends HiveObject{
  Person({required this.name, required this.email, required this.image});

  @HiveField(0)
  String name;

  @HiveField(1)
  String email;

  @HiveField(2)
  String image;

  @override
  String toString() {
    return '$name: $email';
  }
}