import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ComingSoonMovieWidgets extends StatelessWidget {
  final String imageUrls;
  final String overView;
  final String logoUrl;
  final String month;
  final String day;

  const ComingSoonMovieWidgets({
    super.key,
    required this.imageUrls,
    required this.overView,
    required this.logoUrl,
    required this.month,
    required this.day});


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10 ,),
                Text(month, style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),),

                Text(day,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  letterSpacing: 5,
                ),)
              ],
            ),
          ),

          SizedBox(width: 10,),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(imageUrl: imageUrls),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width*0.3,
                        height: size.height*0.2,
                        child: CachedNetworkImage(
                          imageUrl: logoUrl,
                          alignment: Alignment.centerLeft,
                        ),
                      ),

                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.notifications_none_rounded, size: 25, color: Colors.white,),
                         SizedBox(height: 5,),
                          Text("Remind me", style: TextStyle(
                            fontSize: 10,
                          ),)
                        ],
                      ),

                      SizedBox(width: 20,),

                      Column(
                        children: [
                          Icon(Icons.info_outline_rounded, size: 25, color: Colors.white,),
                          SizedBox(height: 5,),
                          Text("Info", style: TextStyle(
                            fontSize: 10,
                          ),)
                        ],
                      ),
                      SizedBox(width: 10,),
                    ],
                  ),

                  SizedBox(height: 20,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Coming on $month $day", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),),
                    ],
                  ),
                  
                  SizedBox(height: 10,),
                  
                  Text(overView,
                    maxLines: 4,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    overflow: TextOverflow.ellipsis,
                  ),)

                ],
              )),
        ],
      ),
    );
  }
}
