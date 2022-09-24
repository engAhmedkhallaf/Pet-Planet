import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? id;
  final String displayName;
  final String email;
  final String phoneNumber;
  final String address;
  final String photoUrl;
  final DateTime? createdAt;
  final bool? isEmailVerified;

  const UserModel({
    this.id,
    this.displayName = '',
    this.email = '',
    this.phoneNumber = '',
    this.address = '',
    this.photoUrl = '',
    this.createdAt,
    this.isEmailVerified = false,
  });

  UserModel copyWith({
    String? id,
    String? displayName,
    String? email,
    String? phoneNumber,
    String? address,
    String? photoUrl,
    DateTime? createdAt,
    bool? isEmailVerified,
  }) {
    return UserModel(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      photoUrl: photoUrl ?? this.photoUrl,
      createdAt: createdAt ?? this.createdAt,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      displayName: json['displayName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      photoUrl: json['photoUrl'],
      createdAt: json['createdAt'].toDate(),
      isEmailVerified: json['isEmailVerified'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'displayName': displayName,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
      'photoUrl': photoUrl,
      'createdAt': createdAt as Object,
      'isEmailVerified': isEmailVerified as Object,
    };
  }

  static const empty = UserModel(id: '');
  @override
  List<Object?> get props => [
        id,
        displayName,
        email,
        phoneNumber,
        address,
        photoUrl,
        createdAt,
        isEmailVerified,
      ];
}
