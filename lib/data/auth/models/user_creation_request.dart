class UserCreationRequest {
  final String firstName, lastName, email, password;
  String? age;
  int? gender;

  UserCreationRequest(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      this.age,
      this.gender});
}
