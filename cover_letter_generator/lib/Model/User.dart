class User {
  int id;
  String firstName;
  String lastName;
  String email;
  String password;
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });
  int get getId => id;
  set setId(int id) => this.id = id;

  String get getFirstName => firstName;
  set setFirstName(String firstName) => this.firstName = firstName;

  String get getLastName => lastName;
  set setLastName(String lastName) => this.lastName = lastName;

  String get getEmail => email;
  set setEmail(String email) => this.email = email;

  String get getPassword => password;
  set setPassword(String password) => this.password = password;
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      password: '',
    );
  }
}
