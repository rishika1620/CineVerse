import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/tv_series_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomCarouselSlider extends StatelessWidget {

  final TvSeriesModel data;
  const CustomCarouselSlider({super.key, required this.data});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: (size.height * 0.1 <300)? 300 : size.height * 0.1 ,
      child: CarouselSlider.builder(
          itemCount: data.results.length,
          itemBuilder: (BuildContext context, int index, int realIndex){
            var url = data.results[index].backdropPath.toString();


            return GestureDetector(
                child: Column(
                  children: [
                    CachedNetworkImage(imageUrl: '$imageUrl$url',),
                    SizedBox(height: 10,),
                    Text(data.results[index].name, style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),),
                  ],
                )
            );
          },
          options: CarouselOptions(
            height: (size.height * 0.1 <300)? 300 : size.height * 0.1 ,
            aspectRatio: 16/9,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(seconds: 800),
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            initialPage: 0,

          ))
    );
  }
}
