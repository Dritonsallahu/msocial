import 'package:flutter/material.dart';
import 'package:msocial/widgets/home/Pages/PageProfile/media_page.dart';
import 'package:msocial/widgets/home/Pages/PageProfile/my_posts.dart';

import '../../my_code.dart';


// ignore: must_be_immutable
class ProfileNavPages extends StatefulWidget {
  TabController? tabController;
  ProfileNavPages({Key? key,this.tabController}) : super(key: key);

  @override
  _ProfileNavPagesState createState() => _ProfileNavPagesState();
}

class _ProfileNavPagesState extends State<ProfileNavPages> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Container(
        width: getPhoneWidth(context),
        height: getSafeAreaFullHeight(context),
        color: Colors.white,
        child: TabBarView(
          controller: widget.tabController,
          children:   const [
            MyPosts(),
            MediaPage(),
            Center(child: Text("Activity")),
            Center(child: Text("Inights")),
          ],
        ));
  }
}
