class User {
  User(
      {required this.username,
      required this.email,
      required this.company,
      required this.phoneNumber});

  final String username;
  final String? email;
  final String? company;
  final String? phoneNumber;
}
