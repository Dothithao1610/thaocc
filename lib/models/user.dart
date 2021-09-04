import 'dart:convert';

import 'package:flutter/foundation.dart';

class User {
  String id;
  String username;
  String email;
  String password;
  String role;
  List<String> listNode;
  String date;
  dynamic info;

  User({
    this.id,
    this.username,
    this.email,
    this.password,
    this.role,
    this.listNode,
    this.date,
    this.info,
  });

  User copyWith({
    String id,
    String username,
    String email,
    String role,
    List<String> listNode,
    String date,
    dynamic info,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      role: role ?? this.role,
      listNode: listNode ?? this.listNode,
      date: date ?? this.date,
      info: info ?? this.info,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'username': username,
      'email': email,
      'password': password,
      'role': role,
      'listNode': listNode,
      'date': date,
      'info': info,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'],
      username: map['username'],
      email: map['email'],
      role: map['role'],
      listNode: List<String>.from(map['listNode']),
      date: map['date'],
      info: map['info'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email, role: $role, listNode: $listNode, date: $date, info: $info)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.username == username &&
        other.email == email &&
        other.role == role &&
        listEquals(other.listNode, listNode) &&
        other.date == date &&
        other.info == info;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        email.hashCode ^
        role.hashCode ^
        listNode.hashCode ^
        date.hashCode ^
        info.hashCode;
  }
}
