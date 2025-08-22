class UserModel {
  final String uid;
  final String email;
  final String? displayName;
  final String? token;

  const UserModel({
    required this.uid,
    required this.email,
    this.displayName,
    this.token,
  });

  factory UserModel.fromFirebase(dynamic user, {String? token}) {
    return UserModel(
      uid: user.uid,
      email: user.email ?? '',
      displayName: user.displayName,
      token: token,
    );
  }

  UserModel copyWith({
    String? uid,
    String? email,
    String? displayName,
    String? token,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      token: token ?? this.token,
    );
  }
}
