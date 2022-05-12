import 'package:flutter/material.dart';
import 'package:msocial/Animacionet/fade_route.dart';
import 'package:msocial/GlobalConfigs/fonts.dart';
import 'package:msocial/my_code.dart';
import 'package:msocial/widgets/profile/Friends/friend_profile.dart';

class Friends extends StatefulWidget {
  const Friends({Key? key}) : super(key: key);

  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Friends"),centerTitle: true,),
      body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 3.0,
          mainAxisSpacing: 3.0,
          children: List.generate(22, (index) {
            return GestureDetector(
              onTap: (){
                Navigator.of(context).push(FadeRoute(page: FriendProfile(tagProfile: "foto:$index",)));
              },
              child: Container(
                color: const Color.fromRGBO(0, 0, 0, 0),
                child: Stack(
                  children: [
                    SizedBox(
                        width: getPhoneWidth(context) / 2,
                        height: getPhoneWidth(context) / 2,
                        child: Hero(
                          tag: "foto:$index",
                          child: Image.asset(
                            "assets/Images/myphoto.jpg",
                            fit: BoxFit.cover,
                          ),
                        )),
                    Positioned(
                        left: 4,
                        top: 4,
                        child: Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.green),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 1.6,left: 5),
                              child: Text(
                                "Online",
                                style: getDefaultFont(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                            ),
                          ],
                        )),
                    Positioned(
                        bottom: 0,
                        child: Container(
                          width: getPhoneWidth(context) / 2,
                          color: Colors.black26,
                          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Driton Sallahu",
                                style: getOpenSansFont(
                                    fontSize: 15, color: Colors.white),
                              ),
                              Text(
                                "Since 20 Jan 2020",
                                style: getOpenSansFont(
                                    fontSize: 11, color: Colors.white),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            );
          })),
    );
  }
}
