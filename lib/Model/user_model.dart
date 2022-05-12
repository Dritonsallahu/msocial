import 'dart:convert';

class UserModel {

  // ignore: non_constant_identifier_names
  String? registration_id;
  // ignore: non_constant_identifier_names
  String? reg_unik_id;
  // ignore: non_constant_identifier_names
  String? first_name;
  // ignore: non_constant_identifier_names
  String? middle_name;
  // ignore: non_constant_identifier_names
  String? last_name;
  String? username;
  String? email;
  String? password;
  // ignore: non_constant_identifier_names
  String? registered_date;
  // ignore: non_constant_identifier_names
  String? ip_address;
  String? gender;
  String? country;
  String? city;
  String? address;
  String? religion;
  String? isActivated;
  String? registrationStep;
  String? userStatus;

  UserModel({
    // ignore: non_constant_identifier_names
    this.registration_id,
    // ignore: non_constant_identifier_names
    this.reg_unik_id,
    // ignore: non_constant_identifier_names
    this.first_name,
    // ignore: non_constant_identifier_names
    this.middle_name,
    // ignore: non_constant_identifier_names
    this.last_name,
    // ignore: non_constant_identifier_names
    this.username,
    this.email,
    this.password,
    // ignore: non_constant_identifier_names
    this.registered_date,
    // ignore: non_constant_identifier_names
    this.ip_address,
    this.gender,
    this.country,
    this.city,
    this.address,
    this.religion,
    this.isActivated,
    this.registrationStep,
    this.userStatus,
  });

  factory UserModel.fromJson(Map<String, dynamic> fromJson) {
    return UserModel(
      registration_id: fromJson['registration_id'],
      reg_unik_id: fromJson['reg_unik_id'],
      first_name: fromJson['first_name'],
      middle_name: fromJson['middle_name'],
      last_name: fromJson['last_name'],
      username: fromJson['username'],
      email: fromJson['email'],
      password: fromJson['password'],
      registered_date: fromJson['registered_date'],
      ip_address: fromJson['ip_address'],
      gender: fromJson['gender'],
      country: fromJson['country'],
      city: fromJson['city'],
      address: fromJson['address'],
      religion: fromJson['religion'],
      isActivated: fromJson['is_activated'],
      registrationStep: fromJson['registration_step'],
      userStatus: fromJson['user_status'],
    );
  }

  static  parseAntariUserModel(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<UserModel>((json) => UserModel.fromJson(json)).toList();
  }
}