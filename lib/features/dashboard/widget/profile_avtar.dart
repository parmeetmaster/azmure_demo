
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isOnline;
  final double sizeOfAvtar;
  final double sizeOfIndicator;

  const ProfileAvatar({
    Key? key,
    required this.imageUrl,
    this.isOnline = false,
    this.sizeOfAvtar=25,
    this.sizeOfIndicator=12
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Circular Profile Image
        CircleAvatar(
          radius: sizeOfAvtar, // Size of the avatar
          backgroundImage: NetworkImage(imageUrl),
        ),

        if (isOnline)
          Positioned(
            bottom: 0,
            right: 8,
            child: Container(
              width: sizeOfIndicator,
              height: sizeOfIndicator,
              decoration: BoxDecoration(
                color: Colors.green, // Color of the indicator
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white, // Border color to separate it from the avatar
                  width: 2,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
