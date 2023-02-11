import 'package:objectbox/objectbox.dart';

@Entity()
class Login {
  @Id()
  int id;
  String username;
  String password;

  Login({
    this.id = 0,
    required this.username,
    required this.password,
  });
}
