// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
    String? email;
    String? password;
    String? name;
    String? avatar;
    String? role;
    int? id;

    Register({
        this.email,
        this.password,
        this.name,
        this.avatar,
        this.role,
        this.id,
    });

    factory Register.fromJson(Map<String, dynamic> json) => Register(
        email: json["email"],
        password: json["password"],
        name: json["name"],
        avatar: json["avatar"],
        role: json["role"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "name": name,
        "avatar": avatar,
        "role": role,
        "id": id,
    };
}
