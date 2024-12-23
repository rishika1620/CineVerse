import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/MovieRecommendationModel.dart';
import 'package:netflix_clone/models/search_movie_model.dart';
import 'package:netflix_clone/screens/MovieDetailScreen.dart';
import 'package:netflix_clone/services/api_services.dart';

class Search_Screen extends StatefulWidget {
  const Search_Screen({super.key});

  @override
  State<Search_Screen> createState() => _Search_ScreenState();
}

class _Search_ScreenState extends State<Search_Screen> {

  TextEditingController searchController = TextEditingController();
  ApiServices apiServices = ApiServices();

  SearchMoviesModel? searchMoviesModel;

  late Future<MovieRecommendationModel> popularMovies;

  void search(String query){
    apiServices.getSearchedMovies(query).then((results){
      setState(() {
        searchMoviesModel = results;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    popularMovies = apiServices.getPopularMovies();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: CupertinoSearchTextField(
                  padding: EdgeInsets.all(10),
                  controller: searchController,
                  prefixIcon: Icon(Icons.search, color: Colors.grey,),
                  suffixIcon: Icon(Icons.cancel, color: Colors.grey),
                  style: TextStyle(color: Colors.white),
                  backgroundColor: Colors.grey.withOpacity(0.3),
                  onChanged: (value){
                    if(value.isEmpty){
                      
                    }else{
                      search(searchController.text);
                    }
                  },
                ),
              ),

              searchController.text.isEmpty? FutureBuilder(future: popularMovies, builder: (context, snapshot){
                var data =  snapshot.data?.results;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else if (!snapshot.hasData || snapshot.data?.results == null) {
                  return Text("No data available");
                }

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30,),
                      Text("Top Searches",style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      SizedBox(height: 20,),

                      ListView.builder(
                          itemCount: data!.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index){
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: (){Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context) => MovieDetailScreen(movieId:  data[index].id,)));},
                                child: Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Image.network("${imageUrl}${data[index].posterPath}", fit: BoxFit.fill,),
                                      SizedBox(width: 20,),
                                      SizedBox(
                                        width: 240,
                                        child: Text(
                                          data[index].title,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })
                    ],
                  ),
                );
              }) :
              searchMoviesModel == null? SizedBox.shrink():
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: searchMoviesModel?.results.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 5,
                    childAspectRatio: 1.2/2),
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>
                              MovieDetailScreen(movieId: searchMoviesModel!.results[index].id)));
                    },
                    child: Column(
                      children: [
                        searchMoviesModel!.results[index].backdropPath == null?
                        Image.asset("assets/images/netflix_logo.png", height: 170,):
                        CachedNetworkImage(imageUrl:"${imageUrl}${searchMoviesModel!.results[index].backdropPath}", height: 170,),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          child: Text("${searchMoviesModel!.results[index].originalTitle}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              )
          
          
            ],
          ),
        )
      ),
    );
  }
}
