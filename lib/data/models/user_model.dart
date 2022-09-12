import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? id;
  final String? displayName;
  final String? email;
  final String? phoneNumber;
  final String? address;
  final String? photoUrl;
  final DateTime? createdAt;
  final bool ? isEmailVerified;

  const UserModel({
    this.id,
    required this.displayName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.photoUrl,
    required this.createdAt,
    required this.isEmailVerified,
  });

  UserModel copyWith({
    String? id,
    String? displayName,
    String? email,
    String? phoneNumber,
    String? address,
    String? photoUrl,
    DateTime? createdAt,bool ? isEmailVerified,
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

  factory UserModel.fromSnapShot(DocumentSnapshot snapshot) {
    return UserModel(
      id: snapshot.id,
      displayName: snapshot['displayName'],
      email: snapshot['email'],
      phoneNumber: snapshot['phoneNumber'],
      address: snapshot['address'],
      photoUrl: snapshot['photoUrl'],
      createdAt: snapshot['createdAt'],
      isEmailVerified: snapshot['isEmailVerified'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'id':id!,
      'displayName': displayName!,
      'email': email!,
      'phoneNumber': phoneNumber!,
      'address': address!,
      'imageUrl': photoUrl!,
      'createdAt': createdAt!,
      'isEmailVerified': isEmailVerified!,
    };
  }

  @override
  List<Object?> get props => [
        id,
        displayName,
        email,
        phoneNumber,
        address,
        photoUrl,
        createdAt,isEmailVerified,
      ];
}
