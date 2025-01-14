import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSliverAppBar extends StatelessWidget {
  final double expandedHeight;
  final String title;
  final String imageUrl;

  //predefinedProperties

  CustomSliverAppBar({
    required this.expandedHeight,
     this.title="Trainings",
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor: Colors.redAccent,
          appBarTheme: AppBarTheme(backgroundColor: Colors.red),
          textTheme: TextTheme(
              headlineLarge:
              GoogleFonts.montserrat(color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
          headlineMedium: GoogleFonts.roboto(color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold)

          )),
      child: SliverAppBar(
        expandedHeight: expandedHeight,
        pinned: true,
        floating: true,
        flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            // Calculate shrink progress
            final double shrinkOffset = constraints.maxHeight - kToolbarHeight;
            final double progress =
                shrinkOffset / (expandedHeight - kToolbarHeight);

            // Adjust the title size as it shrinks
            final double titleFontSize = lerpDouble(20.0, 16.0, progress)!;
            return FlexibleSpaceBar(
              title: Text(
                title,
                style: TextStyle(
                  fontSize: titleFontSize,
                  color: Colors.black,
                ),
              ),
              centerTitle: true,
              background: Container(
                height: 250,
                color: Theme.of(context).primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBar(
                      title: Text(
                        title,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                      actions: [
                        Icon(
                          Icons.menu_outlined,
                          color:
                              Theme.of(context).textTheme.headlineLarge?.color,
                        ),

                        SizedBox(width: 10,)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 24.0, top: 15, bottom: 10),
                      child: Text(
                        "HighLights",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(fontSize: 18),
                      ),
                    ),
                    Container(
                      height: 146,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            bottom: 0.0,
                            child: Container(
                              height: 70,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                            ),
                          ),

                          // Carousel Slider
                          LayoutBuilder(builder: (
                            context,
                            constrains,
                          ) {
                            return CarouselSlider.builder(
                              options: CarouselOptions(
                                height: constrains.maxHeight * 0.85,
                                enlargeCenterPage: true,
                                autoPlay: false,
                                enableInfiniteScroll: false,
                                viewportFraction: 1.0,
                              ),
                              itemCount: 5,
                              itemBuilder: (context, index, realIndex) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Image.network(
                                    width: double.infinity,
                                    "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            );
                          }),
                          // Left button
                          Positioned(
                            left: 0.0,
                            child: Container(
                              height: 55,
                              width: 22,
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                                size: 16,
                              ),
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          // Right button
                          Positioned(
                            right: 0.0,
                            child: Container(
                              height: 55,
                              width: 22,
                              child: Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: Colors.white,
                                size: 16,
                              ),
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
