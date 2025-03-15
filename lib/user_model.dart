import 'package:e_commerce/utils/formatters/formatters.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.profilePicture,
  });

  // Helper function to get full name
  String get fullName => '$firstName $lastName';

  // Helper function to get formatted phone number
  String get formattedPhoneNo => TFormatters.formatPhoneNumber(phoneNumber);

  // Static function to split full name into first and last name
  static List<String> nameParts(String fullName) => fullName.split(" ");

  // Static function to generate a username from the full name
  static String generateUserName(String fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUserName = '$firstName$lastName';
    String userNameWithPrefix = "_cwt$camelCaseUserName";
    return userNameWithPrefix;
  }

  // ✅ Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "username": username,
      "email": email,
      "phoneNumber": phoneNumber,
      "profilePicture": profilePicture,
    };
  }

  // ✅ Convert JSON to object
  factory UserModel.fromJson(Map<String, dynamic> json) {
    if(json.isNotEmpty) {
      return UserModel(
        id: json["id"]??" ",
        firstName: json["firstName"] ??" ",
        lastName: json["lastName"]??" ",
        username: json["username"]??" ",
        email: json["email"]??" ",
        phoneNumber: json["phoneNumber"]??" ",
        profilePicture: json["profilePicture"]??" ",
      );
    }else{
      return UserModel.empty();
    }
  }

  // ✅ Static function to create an empty UserModel
  static UserModel empty() {
    return UserModel(
      id: '',
      username: '',
      email: '',
      phoneNumber: '',
      firstName: '',
      lastName: '',
      profilePicture: '',
    );
  }
}
