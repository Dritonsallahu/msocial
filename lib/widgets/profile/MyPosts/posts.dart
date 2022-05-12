
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:msocial/GlobalConfigs/fonts.dart';
import 'package:msocial/my_code.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index){
      return Column(
        children: [
          index != 0
              ? const SizedBox()
              : Container(
            width: getPhoneWidth(context),
            padding: const EdgeInsets.only(left: 12,right: 12,bottom: 5,top: 10),
            margin: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      margin: const EdgeInsets.only(right: 10,bottom: 5),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(
                                "assets/Images/myphoto.jpg")),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    Container(
                      width: getPhoneWidth(context) - 110,
                      height: 40,
                      padding: const EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey[200]!)
                      ),
                      child: Row(
                        children: [
                          Text("Share your thoughts...",style: getDefaultFont(color: Colors.grey[500],fontSize: 15),)
                        ],
                      ),
                    )
                  ],
                ),
                const Divider(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        foregroundColor:
                        MaterialStateProperty.all<Color>(
                            Colors.grey[600]!),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(0, 0, 0, 0)),
                      ),
                      child: Row(
                        children:  [
                          SizedBox(width: 20,child: Image.asset("assets/Icons/image_icon.png")),
                          const SizedBox(width: 5,),
                          Text("Photo",style: getDefaultFont(color: Colors.grey[600],fontSize: 15,fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        foregroundColor:
                        MaterialStateProperty.all<Color>(
                            Colors.grey[600]!),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(0, 0, 0, 0)),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 20,child: Image.asset("assets/Icons/video_icon.png")),
                          const SizedBox(width: 5,),
                          Text("Video",style: getDefaultFont(color: Colors.grey[600],fontSize: 15,fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        foregroundColor:
                        MaterialStateProperty.all<Color>(
                            Colors.grey[600]!),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(0, 0, 0, 0)),
                      ),
                      child: Row(
                        children:  [
                          SizedBox(width: 17,child: Image.asset("assets/Icons/camera_icon.png")),
                          const SizedBox(width: 5,),
                          Text("Photo",style: getDefaultFont(color: Colors.grey[600],fontSize: 15,fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right:8.0),
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          foregroundColor:
                          MaterialStateProperty.all<Color>(
                              Colors.grey[600]!),
                          backgroundColor:
                          MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(0, 0, 0, 0)),
                        ),
                        child: Text("...",style: getDefaultFont(color: Colors.grey[600],fontSize: 25,height: 0.4,fontWeight: FontWeight.w600),),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Hero(
                            tag: "profile_image",
                            child: Container(
                              width: 45,
                              height: 45,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/Images/myphoto.jpg")),
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Driton Sallahu",
                                style: GoogleFonts.openSans(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.public,
                                    color: Colors.grey,
                                    size: 14,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "08:00 AM",
                                    style: GoogleFonts.openSans(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey[700]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        index != 1
                            ? const SizedBox()
                            : InkWell(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(
                                top: 12, right: 20),
                            width: 70,
                            height: 30,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(
                                    0, 96, 169, 0.5),
                                borderRadius:
                                BorderRadius.circular(5)),
                            child: Center(
                              child: Text(
                                "Follow",
                                style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                        PopupMenuButton(
                          itemBuilder: (context) {
                            return [
                              const PopupMenuItem(
                                child: SizedBox(
                                    width: 100, child: Text("Edit")),
                              ),
                              const PopupMenuItem(
                                child: Text("Share"),
                              ),
                              const PopupMenuItem(
                                child: Text("Pin"),
                              ),
                              const PopupMenuItem(
                                child: Text("Delete"),
                              ),
                            ];
                          },
                          enableFeedback: true,
                          child: Text(
                            "...",
                            style: GoogleFonts.openSans(fontSize: 27),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 13,
                ),
                Container(
                  padding: const EdgeInsets.only(right: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      index != 1
                          ? const SizedBox()
                          : Image.asset("assets/Images/earthquake.jpeg"),
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        "Tërmetet janë dëshmitë më të fuqishme",
                        style: getDefaultFont(fontSize: 15.7,height: 1.4,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Tërmetet janë dëshmitë më të fuqishme, se për sa kohë të shpejtë, mblidhen njerëzit për në Ditën e Llogarisë. "
                            "Ditën kur me ata hapet toka, e ata nguten (për vendtubim), e ai është një tubim i lehtë për Ne.",
                        style: getDefaultFont(fontSize: 15.3,height: 1.4,color: Colors.grey[800],
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              foregroundColor:
                              MaterialStateProperty.all<Color>(
                                  Colors.grey),
                              backgroundColor:
                              MaterialStateProperty.all<Color>(
                                  const Color.fromRGBO(0, 0, 0, 0)),
                            ),
                            child: Row(
                              children: [
                                const Text("Seen  "),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(100),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                "assets/Images/myphoto.jpg")),
                                      ),
                                    ),
                                    Positioned(
                                      left: 3,
                                      child: Container(
                                        padding: const EdgeInsets.only(left: 3),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                100),
                                            color: Colors.white),
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                100),
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    "assets/Images/myphoto.jpg")),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const Text(
                                  "   3 more",
                                  style: TextStyle(fontSize: 11),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  foregroundColor:
                                  MaterialStateProperty.all<Color>(
                                      Colors.grey),
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(
                                      const Color.fromRGBO(
                                          0, 0, 0, 0)),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 19,child: Image.asset("assets/Icons/share_icon.png",color: Colors.black38)),
                                    const SizedBox(width: 5,),
                                    Text("112",style: getDefaultFont(fontSize: 12,fontWeight: FontWeight.w500),)
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  foregroundColor:
                                  MaterialStateProperty.all<Color>(
                                      Colors.grey),
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(
                                      const Color.fromRGBO(
                                          0, 0, 0, 0)),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 13,child: Image.asset("assets/Icons/comment_icon.png",color: Colors.black38)),
                                    const SizedBox(width: 5,),
                                    Text("112",style: getDefaultFont(fontSize: 12,fontWeight: FontWeight.w500),)
                                  ],
                                ),
                              ),

                              TextButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  foregroundColor:
                                  MaterialStateProperty.all<Color>(
                                      Colors.grey),
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(
                                      const Color.fromRGBO(
                                          0, 0, 0, 0)),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(width: 13,child: Image.asset("assets/Icons/like_icon.png",color: Colors.black38,)),
                                    const SizedBox(width: 5,),
                                    Text("112",style: getDefaultFont(fontSize: 12,fontWeight: FontWeight.w500),)
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },itemCount: 3,);
  }
}
