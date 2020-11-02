class User {
  final String id;
  final String name;

  User({this.id, this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['name'],
    );
  }
}
