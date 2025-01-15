import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:task_flutter/features/dashboard/widget/profile_avtar.dart';

import '../../../constants/colors.dart';

class DashBordTrainingListItem extends StatelessWidget {
  const DashBordTrainingListItem({super.key});

  @override
  Widget build(BuildContext pcontext) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: 150,
                maxHeight: 170),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Oct 11-13, 2019",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "8:30 am - 12:30pm",
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Convention Hall, Greater Des Monines",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 5, right: 10, top: 10, bottom: 10),
                  child: const RotatedBox(
                    quarterTurns: 1, // Rotates the dotted line vertically
                    child: DottedLine(
                      direction: Axis.horizontal,
                      // Keeps the line horizontal before rotation
                     // lineLength: 150,
                      // Length of the vertical divider
                      dashLength: 6,
                      // Length of each dash
                      dashGapLength: 2,
                      // Gap between dashes
                      lineThickness: 2,
                      // Thickness of the dashes
                      dashColor: ColorName.filterBlack, // Color of the dashes
                    ),
                  ),
                ),
                Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Filling Fast!",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                                color: ColorName.primaryRed),
                          ),
                          Text(
                            "Safe Scrum Master(4.6)",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black),
                          maxLines: 2,

                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ProfileAvatar(
                                imageUrl:
                                    'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSQT0Ex_kheCACKmF8EXXF-Rn8pf1KZNaX10IyVr1KATSqGSUwNa97WHFewOB4NneQj242PyoKQpg-_YCiOBs8rHA',
                                isOnline: true,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Keyote Speaker",
                                    style: TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.bold),
                                  ),
                                  Text("Heleen Gribble",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ))
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        Align(alignment: Alignment.centerRight,
                        child: _getButton(),
                        )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getButton() {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
      decoration: BoxDecoration(color: ColorName.primaryRed,borderRadius: BorderRadius.only(topLeft: Radius.circular(5),

          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5)
      )),
      child: Text(
        "Enroll Now",
        style: TextStyle(
            fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }
}
