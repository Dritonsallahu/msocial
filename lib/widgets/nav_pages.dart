import 'package:flutter/material.dart';
import 'package:msocial/providers/nav_provider/nav_pages_provider.dart';
import 'package:msocial/widgets/home/home_page.dart';
import 'package:msocial/widgets/profile/my_profile.dart';
import 'package:provider/provider.dart';

class NavPages extends StatefulWidget {

  const NavPages({Key? key}) : super(key: key);

  @override
  _NavPagesState createState() => _NavPagesState();
}

class _NavPagesState extends State<NavPages> {


  changeNavPage(int index){
    var navPage = Provider.of<NavPagesProvider>(context,listen: false);
    navPage.changeSelectedItem(index);
  }

  @override
  Widget build(BuildContext context) {
    var navPage = Provider.of<NavPagesProvider>(context);
    return PageView(
      controller: navPage.getPageController(),
      onPageChanged: (index){
        changeNavPage(index);
      },
      children: const [
        HomePage(),
        Center(child: Text("2")),
        Center(child: Text("3")),
        MyProfile(),
      ],
    );
  }
}
