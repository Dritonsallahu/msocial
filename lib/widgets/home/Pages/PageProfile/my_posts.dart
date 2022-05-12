import 'package:flutter/material.dart';
import 'package:msocial/GlobalConfigs/fonts.dart';

import '../../../../my_code.dart';

class MyPosts extends StatelessWidget {
  const MyPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,index){
      return Padding(
        padding: const EdgeInsets.only(top:10,right:15,bottom:10,left:10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top:3),
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: const DecorationImage(
                        image: AssetImage("assets/Images/myphoto.jpg"),
                      )
                  ),
                ),
                const SizedBox(width: 8,),
                SizedBox(
                  width: getPhoneWidth(context) - 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: getDefaultFont(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),
                          children: [
                            TextSpan(text:"Muhamed Ali👋🏻",style: getDefaultFont(fontSize: 14,fontWeight: FontWeight.w500,),),
                            TextSpan(text:" @driitoonss",style: getDefaultFont(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.black38),)
                          ],
                        ),overflow: TextOverflow.ellipsis,
                      ),
                      Text("We are bootstraping @konnect22 a social media to connect individuals with successful"
                          "people to bring out the best in them",style: getDefaultFont(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.black),),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 17,child: Image.asset("assets/Icons/like_icon.png")),
                              const SizedBox(width: 5,),
                              Text("113",style: getDefaultFont(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black54),),
                            ],
                          ),
                          const SizedBox(width: 20,),
                          Row(
                            children: [
                              SizedBox(width: 15,child: Image.asset("assets/Icons/comment_icon.png")),
                              const SizedBox(width: 5,),
                              Text("8",style: getDefaultFont(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black54),),
                            ],
                          ),
                          const SizedBox(width: 20,),
                          Row(
                            children: [
                              SizedBox(width: 19,child: Image.asset("assets/Icons/share_icon.png")),
                              const SizedBox(width: 2,),
                              Text("2",style: getDefaultFont(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black54),),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Text("24 Jun",style: getDefaultFont(fontSize: 11,fontWeight: FontWeight.w400,color: Colors.black38),),
          ],
        ),
      );
    },itemCount: 4,);
  }
}
