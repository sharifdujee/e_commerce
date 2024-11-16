import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_admin_panel/common/enum.dart';
import 'package:e_commerce_admin_panel/utils/theme/formatter.dart';

class UserModel{
  final String? id;
  String firstName;
  String lastName;
  String userName;
  String email;
  String phoneNumber;
  String profilePicture;
  AppRole role;
  DateTime? createAt;
  DateTime? updateAt;

  UserModel({
    this.id,
    required this.email,
    this.firstName = '',
    this.lastName = '',
    this.userName = '',
    this.phoneNumber = '',
    this.profilePicture = '',
    this.role = AppRole.user,
    this.createAt,
    this.updateAt,

});
  ///helper method
 String get fullName => '$firstName $lastName';
 String get formatedDate => TFormater.formatDate(createAt);
 String get formatedUpdateDate => TFormater.formatDate(updateAt);
 String get formatedPhoneNo => TFormater.formatPhoneNumber(phoneNumber);

 /// empty
 static UserModel empty() => UserModel(email: '');

 /// to json
  Map<String, dynamic> toJson(){
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'UserName': userName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      'Role': role.name.toString(),
      'CreatedAt': createAt,
      'UpdatedAt': updateAt,
    };
  }

  /// from
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data.containsKey('FirstName') ? data['FirstName'] ?? '' : '',
        lastName: data.containsKey('LastName') ? data['LastName'] ?? '' : '',
        userName: data.containsKey('UserName') ? data['UserName'] ?? '' : '',
        email: data.containsKey('Email') ? data['Email'] ?? '' : '',
        phoneNumber: data.containsKey('PhoneNumber') ? data['PhoneNumber'] ?? '' : '',
        profilePicture: data.containsKey('ProfilePicture') ? data['ProfilePicture'] ?? '' : '',
        role: data.containsKey('Role')? (data['Role']??AppRole.user) == AppRole.admin.name.toString()?AppRole.admin: AppRole.user:AppRole.user,
        createAt: data.containsKey('CreatedAt') ? data['CreatedAt']?.toDate() ?? DateTime.now() : DateTime.now(),
        updateAt: data.containsKey('UpdatedAt') ? data['UpdatedAt']?.toDate() ?? DateTime.now() : DateTime.now(),
      );

    }
    else{
      return empty();
    }
 }
}