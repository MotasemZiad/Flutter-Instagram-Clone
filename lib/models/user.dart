import 'dart:convert';

class User {
  late final String id;
  late final String username;
  late final String email;
  late final String bio;
  late final String image;
  late final List followers;
  late final List following;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.bio,
    required this.image,
    required this.followers,
    required this.following,
  });

  factory User.fromMap(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      bio: json['bio'],
      image: json['image'],
      followers: json['followers'],
      following: json['following'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'bio': bio,
      'image': image,
      'followers': followers,
      'following': following,
    };
  }


  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
