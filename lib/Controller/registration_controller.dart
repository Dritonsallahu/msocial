
import 'package:http/http.dart' as http;
import 'package:msocial/ServerConfig/URLs.dart';
class RegistrationController{

  static Future<String?> emailRegistration(email,password,code) async{
    var map = <String,dynamic>{};
    map['email'] = email;
    map['password'] = password;
    map['code'] = code.toString();
    map['ph_session'] = "H+MbQeThWmZq4t6w9z&F)J@NcRfUjX";

    var url = Uri.parse(registration_url);
    var response = await http.post(url,body: map);
    if(response.statusCode == 200){
      return response.body;
    }
    else{
      return response.body;
    }
  }

  static Future<String?> activateUser (email,code) async{
    var map = <String,dynamic>{};
    map['email'] = email;
    map['code'] = code;
    map['ph_session'] = "(H+MbQeThWmZq4t6w9z&F)J@NcRfUj";

    var url = Uri.parse(activation_url);
    var response = await http.post(url,body: map);
    if(response.statusCode == 200){
      return response.body;
    }
    else{
      return response.body;
    }
  }

  static Future<String?> personalData (email,firstName,middleName,lastName,username) async{
    var map = <String,dynamic>{};
    map['email'] = email;
    map['first_name'] = firstName;
    map['middle_name'] = middleName;
    map['last_name'] = lastName;
    map['username'] = username;
    map['ip_address'] = "";
    map['ph_session'] = "UkXp2s5v8y/B?E(H+KbPeShVmYq3t6w9";

    var url = Uri.parse(registration_url);
    var response = await http.post(url,body: map);
    if(response.statusCode == 200){
      return response.body;
    }
    else{
      return response.body;
    }
  }


  static Future<String?> extraPersonalData (email,country,city,address,religion) async{
    var map = <String,dynamic>{};
    map['email'] = email;
    map['country'] = country;
    map['city'] = city;
    map['address'] = address;
    map['religion'] = religion;
    map['ph_session'] = "&F)J@NcRfUjXn2r5u7x!A%D*G-KaPdSg";

    var url = Uri.parse(registration_url);
    var response = await http.post(url,body: map);
    if(response.statusCode == 200){
      return response.body;
    }
    else{
      return response.body;
    }
  }

  static Future<String?> resendCode (email,code) async{
    var map = <String,dynamic>{};
    map['email'] = email;
    map['code'] = code;
    map['ph_session'] = "?D(G+KbPeShVmYq3t6w9z&E)H@McQf";

    var url = Uri.parse(registration_url);
    var response = await http.post(url,body: map);
    if(response.statusCode == 200){
      return response.body;
    }
    else{
      return response.body;
    }
  }
}