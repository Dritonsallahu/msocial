import 'package:flutter/material.dart';
import 'package:msocial/Animacionet/scale_route.dart';
import 'package:msocial/Animacionet/size_route.dart';
import 'package:msocial/GlobalConfigs/fonts.dart';
import 'package:msocial/my_code.dart';

import 'chat_room.dart';

class Rooms extends StatefulWidget {
  @override
  _RoomsState createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading:   IconButton(
          icon: const Icon(Icons.arrow_back,color: Color.fromRGBO(0, 96, 168, 1),), onPressed: () {  },
        ),
        centerTitle: true,
        title: Text(
          "Messages",
          style: getDefaultFont(
              fontSize: 19, color: const Color.fromRGBO(0, 96, 168, 1), fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        color: Colors.white,
        width: getPhoneWidth(context),
        height: getPhoneHeight(context),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                Navigator.of(context).push(SizeRoute(page: ChatRoom()));
              },
              child: Container(
                color: const Color.fromRGBO(0, 0, 0, 0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    image:
                                        AssetImage("assets/Images/myphoto.jpg"))),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 6, top: 6),
                                    child: Text(
                                      "Driton Sallahu",
                                      style: getDefaultFont(
                                          fontSize: 17,
                                          color: Colors.grey[700],
                                          height: 1,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6),
                                child: SizedBox(
                                    width: getPhoneWidth(context) - 120,
                                    child: Text(
                                      "Sulmi i ndodhur dje ishte si rezutat i nje operacioni nga ana e amerikaneve",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: getDefaultFont(
                                          fontSize: 14,
                                          color: index == 2 || index == 7 || index == 8 || index == 11 ?  Colors.grey[600]:Colors.grey[500],
                                          fontWeight: index == 2 || index == 7 || index == 8 || index == 11 ? FontWeight.w600:FontWeight.w400),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "10:25",
                            style: getDefaultFont(
                                fontSize: 12,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 4,),
                          index == 0 || index == 1 || index == 4 || index == 6 || index == 7 ? Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color.fromRGBO(0, 96, 168, 1)),
                            child: Text(
                              index == 0 ? "6":"12",
                              style: getDefaultFont(
                                color: Colors.white,
                                fontSize: 11,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 5),
                          ): SizedBox()
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: 20,
        ),
      ),
    );
  }
}
