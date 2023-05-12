class UserModel {
  late final String email;
  late final String username;
  late final String password;
  late final String companyName;
  late final String phoneNumber;

  UserModel({
    required this.email,
    required this.username,
    required this.password,
    required this.companyName,
    required this.phoneNumber,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      username: map['username'],
      password: map['password'],
      companyName: map['companyName'],
      phoneNumber: map['phoneNumber'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'username': username,
      'password': password,
      'companyName': companyName,
      'phoneNumber': phoneNumber,
    };
  }
}
