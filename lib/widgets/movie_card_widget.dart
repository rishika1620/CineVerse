import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/upcoming_model.dart';

import '../screens/MovieDetailScreen.dart';

class MovieCardWidget extends StatelessWidget {

  final Future<UpcomingMoviesModel> future;
  final String headLineText;
  const MovieCardWidget({super.key, required this.future, required this.headLineText});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: future, builder: (context, snapshot){
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
            Text(headLineText,style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(height: 20,),

            Expanded(
              child: ListView.builder(
                  itemCount: data!.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                     return Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: InkWell(
                         onTap: (){
                           Navigator.push(context, MaterialPageRoute(
                               builder: (context) =>
                                   MovieDetailScreen(movieId: data[index].id)));
                         },
                         child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.network("${imageUrl}${data[index].posterPath}", fit: BoxFit.fill,),
                          ),
                       ),
                     );
              }),
            )
          ],
        ),
      );
    });
  }
}
