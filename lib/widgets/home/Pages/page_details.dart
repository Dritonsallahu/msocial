import 'package:flutter/material.dart';
import 'package:msocial/GlobalConfigs/fonts.dart';
import 'package:msocial/my_code.dart';
import 'package:msocial/widgets/home/Habits/habits.dart';
import 'package:msocial/widgets/home/Pages/PageProfile/media_page.dart';
import 'package:msocial/widgets/home/Pages/PageProfile/my_posts.dart';
import '../../profile/profile_nav_pages.dart';
import 'package:msocial/widgets/profile/Friends/friends.dart';
import 'package:msocial/widgets/profile/Media/media.dart';
import 'package:msocial/widgets/profile/MyPosts/posts.dart';
import 'package:msocial/widgets/profile/Profile/profile.dart';

class PageDetails extends StatefulWidget {
  const PageDetails({Key? key}) : super(key: key);

  @override
  _PageDetailsState createState() => _PageDetailsState();
}

class _PageDetailsState extends State<PageDetails>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Container(
            color: Theme.of(context).primaryColor,
            child: NestedScrollView(
              body: Container(
                  width: getPhoneWidth(context),
                  height: getSafeAreaFullHeight(context),
                  color: Colors.white,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      MyPosts(),
                      MediaPage(),
                      Text("s"),
                      Text("s"),
                      Text("s"),
                    ],
                  )),
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) => [

                SliverAppBar(
                  pinned: false,
                  floating: false,
                  elevation: 0,
                  backgroundColor: Colors.white,
                  flexibleSpace: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(
                        height: 2,
                        thickness: 0.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Hero(
                                  tag: "profile_image",
                                  child: Container(
                                    width: 85,
                                    height: 85,
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/Images/myphoto.jpg"),
                                        ),
                                        borderRadius: BorderRadius.circular(10)),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Driton Sallahu",
                              style: getDefaultFont(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 17,
                                  height: 1),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: getPhoneWidth(context) - 50,
                              child: Text(
                                "Lastest news and stories in the developer world",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: getDefaultFont(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17,
                                    color: const Color.fromRGBO(159, 159, 159, 1),
                                    height: 1.3),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  collapsedHeight: 195,
                ),
                SliverAppBar(
                  pinned: true,
                  floating: false,
                  elevation: 0,automaticallyImplyLeading: false,toolbarHeight: 44,
                  backgroundColor: Colors.white,titleSpacing: 4,
                  title: TabBar(
                      labelPadding: const EdgeInsets.symmetric(vertical: 8),padding: EdgeInsets.all(0),
                      controller: _tabController,
                      isScrollable: true,indicatorPadding: EdgeInsets.all(0),
                      indicatorColor: const Color.fromRGBO(0, 96, 168, 1),
                      tabs: [
                        SizedBox(
                          width: 90,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Posts",
                                style: getDefaultFont(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(159, 159, 159, 1)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Media",
                                style: getDefaultFont(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(159, 159, 159, 1)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 75,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Links",
                                style: getDefaultFont(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(159, 159, 159, 1)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 90,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Peoples",
                                style: getDefaultFont(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(159, 159, 159, 1)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Settings",
                                style: getDefaultFont(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(159, 159, 159, 1)),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ],
            )),
      ),
    );
  }
}
