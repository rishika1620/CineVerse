import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/MovieDetailsModel.dart';
import 'package:netflix_clone/models/MovieRecommendationModel.dart';
import 'package:netflix_clone/services/api_services.dart';
class MovieDetailScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailScreen({super.key, required this.movieId});
  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {

  ApiServices apiServices = ApiServices();
  late Future<MovieDetailsModel> movieDetail;
  late Future<MovieRecommendationModel> movieRecommendationFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchInitialData();
  }

  fetchInitialData(){
    movieDetail= apiServices.getMovieDetail(widget.movieId);
    movieRecommendationFuture = apiServices.getMoviesRecommendation(widget.movieId);
    setState(() {

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: movieDetail,
          builder: (context, snapshot){
            if(snapshot.hasData){
              final movie = snapshot.data;
              String genereText = movie!.genres.map((genre) => genre.name).join(',');
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height*0.4,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage("${imageUrl}${movie!.backdropPath}."),
                              fit: BoxFit.cover,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.arrow_back, color: Colors.white,),
                                                      ),
                              ],
                            )
                          )
                        ],
                      ),

                      SizedBox(height: 20,),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            movie.title, style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),),
                          SizedBox(height: 15,),

                          SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(movie.releaseDate.year.toString(), style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 17,
                                  ),
                                  ),
                                  SizedBox(width: 30,),

                                  Text(
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    genereText, style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 17,
                                  ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 20,),

                          Text(
                            movie.overview,
                            maxLines: 6,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                            color: Colors.white,
                              fontSize: 17,
                          ),
                          ),
                        ],
                      ),

                      SizedBox(height: 30,),
                      
                      FutureBuilder(future: movieRecommendationFuture, builder: (context, snapshot){
                        if(snapshot.hasData){
                          final movieRecommendation = snapshot.data;
                          return movieRecommendation!.results.isEmpty? SizedBox() :
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("More Like this"),
                                  SizedBox(height: 20,),
                                  GridView.builder(
                                      itemCount: movieRecommendation.results.length,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          mainAxisSpacing: 15,
                                        crossAxisSpacing: 5,
                                        childAspectRatio: 1.5/2,
                                      ), itemBuilder: (context, index){
                                        return InkWell(
                                            onTap: (){
                                              Navigator.push(context, MaterialPageRoute(
                                                  builder: (context) =>
                                                      MovieDetailScreen(movieId: movieRecommendation!.results[index].id)));
                                            },
                                            child: CachedNetworkImage(imageUrl: "${imageUrl}${movieRecommendation.results[index].posterPath}",));
                                  })
                                  
                                ],
                              );
                        }else{
                          return const Text("Something went wrong");
                        }
                      })
                      
                    ],
                  ),
                ),
              );
            }else{
              return Center(
                  child: CircularProgressIndicator(),
                  //child: Text("Error: Failed to load..."),
              );
            }
          }
        ),
      ),
    );
  }
}
