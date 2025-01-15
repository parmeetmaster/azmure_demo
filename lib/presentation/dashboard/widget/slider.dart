import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_flutter/constants/colors.dart';
import 'package:task_flutter/controller/dashboard/dashboard_controller.dart';
import 'package:task_flutter/domain/model/dashboard_model/dashboard_bloc_states.dart';
import 'package:task_flutter/domain/model/dashboard_model/dashboard_bloc_states.dart'
    as dashboardmodel;
import 'package:task_flutter/presentation/details/training_details_screen.dart';

class CustomSliverAppBar extends StatelessWidget {
  final double expandedHeight;
  final String title;
  final String imageUrl;

  DashBoardController controller = Get.find<DashBoardController>();

  //predefinedProperties

  CustomSliverAppBar({
    required this.expandedHeight,
    this.title = "Trainings",
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor: ColorName.primaryRed,
          appBarTheme: AppBarTheme(backgroundColor: ColorName.primaryRed),
          textTheme: TextTheme(
              headlineLarge: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
              headlineMedium: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
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
              titlePadding:
                  EdgeInsets.only(left: 20, bottom: kToolbarHeight / 3),
              title: Text(
                progress < 0.21 ? title : "",
                style: TextStyle(
                    fontSize: titleFontSize,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
              background: Container(
                height: 250,
                color: ColorName.primaryRed,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBar(
                      title: Text(
                        title,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      backgroundColor: ColorName.primaryRed,
                      actions: [
                        Icon(
                          Icons.menu_outlined,
                          color:
                              Theme.of(context).textTheme.headlineLarge?.color,
                        ),
                        SizedBox(
                          width: 10,
                        )
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
                              carouselController: controller.clousalController,
                              options: CarouselOptions(
                                enableInfiniteScroll: true,
                                height: constrains.maxHeight * 0.85,
                                enlargeCenterPage: true,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 5),
                                viewportFraction: 1.0,
                              ),
                              itemCount: controller.state.value.sliders.length,
                              itemBuilder: (context, index, realIndex) {
                                return SliderComponent(
                                  item: controller.state.value.sliders[index],
                                  onClick: () {
                                    print("clci");
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            TrainingDetailsScreen(
                                                training: controller.state
                                                    .value.sliders[index])));
                                  },
                                );
                              },
                            );
                          }),
                          // Left button
                          Positioned(
                            left: 0.0,
                            child: GestureDetector(
                              onTap: () {
                                print("click");
                                controller.clousalController.previousPage();
                              },
                              child: AbsorbPointer(
                                absorbing: true,
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
                            ),
                          ),
                          // Right button
                          Positioned(
                            right: 0.0,
                            child: GestureDetector(
                              onTap: () {
                                controller.clousalController.nextPage();
                              },
                              child: AbsorbPointer(
                                absorbing: true,
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

class SliderComponent extends StatelessWidget {
  final Function onClick;
  final dashboardmodel.SliderClousalModel item;

  SliderComponent({required this.item, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: AbsorbPointer(
        absorbing: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: LayoutBuilder(builder: (context, constrains) {
            return Stack(
              children: [
                // Image background
                Image.network(
                  item.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                // Black overlay layer
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black.withOpacity(0.4),
                ),
                // Text positioned at the center-left
                Positioned(
                  top: constrains.maxHeight / 2 - 20,
                  left: 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //safe scrum text
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              item.subTitle,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: constrains.maxWidth - 10,
                        child: Row(
                          children: [
                            Text(
                              item.strikePrice.toString(),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                decoration: TextDecoration.lineThrough,
                                color: Color.lerp(
                                    ColorName.primaryRed, Colors.black, 0.3)!,
                                decorationColor: ColorName.primaryRed,
                                // Optional: Color of the strike line
                                decorationThickness:
                                    2.0, // Optional: Thickness of the strike line
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '\$${item.price.toString()}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: ColorName.primaryRed,
                                // Optional: Color of the strike line
                              ),
                            ),
                            Spacer(),
                            Text(
                              "View Details",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            Icon(
                              Icons.arrow_forward_outlined,
                              color: Colors.white,
                              size: 14,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
