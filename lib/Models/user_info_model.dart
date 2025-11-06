class UserInfoModel {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String profileImage;
  final String dateOfBirth;
  final String joinedAt;
  final String userType;
  final String about;

  UserInfoModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.profileImage,
    required this.dateOfBirth,
    required this.joinedAt,
    required this.userType,
    required this.about,
  });

  /// 🧾 Convert JSON to Model
  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      uid: json['uid'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      gender: json['gender'] ?? '',
      profileImage: json['profileImage'] ?? '',
      dateOfBirth: json['dateOfBirth'] ?? '',
      joinedAt: json['joinedAt'] ?? '',
      userType: json['userType'] ?? '',
      about: json['about'] ?? '',
    );
  }

  /// 🔄 Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'gender': gender,
      'profileImage': profileImage,
      'dateOfBirth': dateOfBirth,
      'joinedAt': joinedAt,
      'userType': userType,
      'about': about,
    };
  }
}
