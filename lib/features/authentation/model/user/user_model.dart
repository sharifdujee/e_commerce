import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../utils/formatters/formater.dart';

class UserModel {
  final String id;
    String firstName;
    String lastName;
  final String username;
  final String email;
  final String phoneNumber;
  final String? password;
   String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
     this.password,
    required this.profilePicture,
  });

  String get fullName => '$firstName $lastName';
  String get formatedPhoneNumber => TFormater.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(fullName) => fullName.split(" ");

  static String generateUserName(fullName){
    List<String> nameParts = fullName.split("");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length >1? nameParts[1].toLowerCase(): "";
    String camelCaseUserName = '$firstName$lastName';
    String userNameWithPrefix = 'cwt_$camelCaseUserName';
    return userNameWithPrefix;
  }
  static UserModel empty() => UserModel(id: '', firstName: '', lastName: '', username: '', email: '', phoneNumber: '', password: '', profilePicture: '');

  // Convert a User object to a Map, for storage in databases like Firebase
  Map<String, dynamic> toJson() {
    return {

      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'profilePicture': profilePicture,
    };
  }

  // Create a User object from a Map (e.g., when retrieving from a database)
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if(document.data()!=null){
      final data = document.data()!;
    return UserModel(
      id: document.id,
      firstName: data['firstName']??'',
      lastName: data['lastName']??'',
      username: data['username']??'',
      email: data['email']??'',
      phoneNumber: data['phoneNumber']??'',
      profilePicture: data['profilePicture'],
    );
  }
    else{
      return UserModel.empty();
    }
    }
}
