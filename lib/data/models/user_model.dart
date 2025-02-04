class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final String accessToken;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.accessToken,
  });

  // Convert JSON to UserModel
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['user']['id'],
      name: json['user']['name'],
      username: json['user']['username'],
      email: json['user']['email'],
      accessToken: json['access_token'],
    );
  }

  // Convert UserModel to JSON for storage of  access token
  Map<String, dynamic> toJson() {
    return {
      'user': {
        'id': id,
        'name': name,
        'username': username,
        'email': email,
      },
      'access_token': accessToken,
    };
  }
}
