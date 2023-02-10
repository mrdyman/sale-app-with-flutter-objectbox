import 'package:objectbox/objectbox.dart';

@Entity()
class User {
  @Id()
  int id;
  String username;
  String password;

  User({
    this.id = 0,
    required this.username,
    required this.password,
  });
}
