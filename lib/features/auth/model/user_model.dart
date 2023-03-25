
class UserModel {
  final String name;
  final String uid;
  final String email;

  UserModel({
    required this.name,
    required this.uid,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'uid': uid,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map,String userId) {
    return UserModel(
      name: map['name'] as String,
      uid: userId,
      email: map['email'] as String,
    );
  }

  
}
