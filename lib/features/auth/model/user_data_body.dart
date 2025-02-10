class UserDataBody {
  final String email;
  final String password;

  UserDataBody({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory UserDataBody.fromMap(Map<String, dynamic> map) {
    return UserDataBody(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }
}
