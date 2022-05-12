import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:msocial/Authorization/auto_login.dart';
import 'package:msocial/Model/user_model.dart';
import 'package:msocial/ServerConfig/URLs.dart';
import 'package:msocial/providers/current_user.dart';
import 'package:provider/provider.dart';

class AuthorizationController {
  AutoLogin? _autoLogin;
 Future<void> auth(String email, String password, context) async {
   var userProvider = Provider.of<CurrentUser>(context,listen: false);

   _autoLogin = AutoLogin();
print("Sdf");
    Map<String, dynamic> map = <String, dynamic>{};
    map['ph_session'] = "5v8y/B?E(H+MbQeThWmZq4t6w9zC&F)";
    map['userdata'] = email;
    map['password'] = password;
    var url = Uri.parse(authentication_url);
    await http.post(url,body: map).then((value){

       if(value.body == "wrong_password"){
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title:  Text("Password is incorrect!",style: GoogleFonts.openSans(fontSize: 16),),
                actions: [
                  TextButton(
                    style: ButtonStyle(

                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                      backgroundColor:  MaterialStateProperty.all<Color>(const Color.fromRGBO(49, 49, 49, 0.1)),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child:  Text("Exit",style: GoogleFonts.openSans(),),
                  ),
                ],
              );
            });
       }
       else if(value.body == "no_email"){
         showDialog(
             context: context,
             builder: (context) {
               return AlertDialog(
                 title:  Text("This email or username doesn't exits!.",style: GoogleFonts.openSans(fontSize: 16),),
                 actions: [
                   TextButton(
                     style: ButtonStyle(

                       foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                       backgroundColor:  MaterialStateProperty.all<Color>(const Color.fromRGBO(49, 49, 49, 0.1)),
                     ),
                     onPressed: () {
                       Navigator.pop(context);
                     },
                     child:  Text("Exit",style: GoogleFonts.openSans(),),
                   ),
                 ],
               );
             });
       }else {
         List<UserModel> user = UserModel.parseAntariUserModel(value.body);
         _autoLogin!.saveNewUser(user[0],context);
         userProvider.newUserModel(user[0]);

       }
    }).catchError((e){
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Cannot connect with server.\nPlease check your connection."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Exit"),
                ),
              ],
            );
          });
    }).onError((error, stackTrace) async {
    });
  }
}
