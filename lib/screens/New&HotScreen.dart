import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/widgets/coming_soon_movie_widgets.dart';

class New_Hot_Screen extends StatefulWidget {
  const New_Hot_Screen({super.key});

  @override
  State<New_Hot_Screen> createState() => _New_Hot_ScreenState();
}

class _New_Hot_ScreenState extends State<New_Hot_Screen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: SafeArea(
            child:  Scaffold(
              backgroundColor: backgroundColor,
              appBar: AppBar(
                elevation: 0,
                title: Text("New & HoT", style: TextStyle(
                  color: Colors.white,
                ),),
                actions: [
                  Icon(Icons.cast, color: Colors.white,),
                  SizedBox(width: 10,),
                  ClipRect(
                    child:Container(
                      color: Colors.blue,
                      height: 27,
                      width: 27,
                    ),
                  ),

                  SizedBox(width: 20,),
                ],
                backgroundColor: backgroundColor,

                bottom: TabBar(
                    dividerColor: Colors.black,
                    isScrollable: false,
                    labelColor: Colors.black,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    unselectedLabelColor: Colors.white,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ) ,
                    tabs: [
                  Tab(
                    text: "  🍿 Coming Soon  ",

                  ),
                  Tab(
                    text: "  🔥 Everyone's Watching  ",

                  )
                ]),
              ),

              body: TabBarView(children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ComingSoonMovieWidgets(
                        imageUrls:
                        'https://miro.medium.com/v2/resize:fit:1024/1*P_YU8dGinbCy6GHlgq5OQA.jpeg',
                        overView:
                        'When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.',
                        logoUrl:
                        "https://s3.amazonaws.com/www-inside-design/uploads/2017/10/strangerthings_feature-983x740.jpg",
                        month: "Jun",
                        day: "19",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ComingSoonMovieWidgets(
                        imageUrls:
                        'https://www.pinkvilla.com/images/2022-09/rrr-review.jpg',
                        overView:
                        'A fearless revolutionary and an officer in the British force, who once shared a deep bond, decide to join forces and chart out an inspirational path of freedom against the despotic rulers.',
                        logoUrl:
                        "https://www.careerguide.com/career/wp-content/uploads/2023/10/RRR_full_form-1024x576.jpg",
                        month: "Mar",
                        day: "07",
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: ComingSoonMovieWidgets(
                    imageUrls:
                    'https://miro.medium.com/v2/resize:fit:1024/1*P_YU8dGinbCy6GHlgq5OQA.jpeg',
                    overView:
                    'When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.',
                    logoUrl:
                    "https://s3.amazonaws.com/www-inside-design/uploads/2017/10/strangerthings_feature-983x740.jpg",
                    month: "Jun",
                    day: "19",
                  ),
                ),
              ]),
            )
    ),);
  }
}
