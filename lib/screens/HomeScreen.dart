import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/tv_series_model.dart';
import 'package:netflix_clone/models/upcoming_model.dart';
import 'package:netflix_clone/screens/SearchScreen.dart';
import 'package:netflix_clone/services/api_services.dart';
import 'package:netflix_clone/widgets/custom_corousel.dart';
import 'package:netflix_clone/widgets/movie_card_widget.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  ApiServices apiServices = ApiServices();
  late Future<UpcomingMoviesModel> upcomingFuture;
  late Future<UpcomingMoviesModel> nowPlayingFuture;
  late Future<TvSeriesModel> topRatedSeriesFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    upcomingFuture = apiServices.getUpcomingMovies();
    nowPlayingFuture = apiServices.getNowPlayingMovies();
    topRatedSeriesFuture = apiServices.getTopRatedSeries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Image.asset("assets/images/logo_netflix.png", height: 75, width: 150,),

        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Search_Screen()));
            },
              child: Icon(
                Icons.search,
                size: 30,
                color: Colors.white,)
          ),

          SizedBox(width: 5,),

          InkWell(
              onTap: (){},
              child: Icon(
                Icons.download,
                size: 30,
                color: Colors.white,)
          ),
          SizedBox(width: 5,),

          ClipRect(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.lightBlue,
              ),
              height: 30,
              width: 30,
            ),
          ),
          SizedBox(width: 25,),

        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(future: topRatedSeriesFuture, builder: (context, snapshot){
              if(snapshot.hasData){
                return CustomCarouselSlider(data: snapshot.data!);
              }
              else{
                return SizedBox.shrink();
              }
            }),

            SizedBox(height: 10,),

            SizedBox(
                height: 220,
                child: MovieCardWidget(future: nowPlayingFuture, headLineText: "Now Playing")
            ),

            SizedBox(height: 20,),
            SizedBox(
                height: 220,
                child: MovieCardWidget(future: upcomingFuture, headLineText: "Upcoming Movies")
            ),
          ],
        ),
      )
    );
  }
}
