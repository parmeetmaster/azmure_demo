


import 'package:flutter/material.dart';

import '../../domain/model/dashboard_model/dashboard_bloc_states.dart';


class TrainingDetailsScreen extends StatelessWidget {
  late final SliderClousalModel training;

  // Passing the Training object as a parameter to the page
  TrainingDetailsScreen({required this.training});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image at the top
            Image.network(
              training.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),

            // Title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                training.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                training.subTitle,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade600,
                ),
              ),
            ),

            // Price and Strike Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Text(
                    'Price: ₹${training.strikePrice}',
                    style: TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Discount Price: ₹${training.price}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),

            // Description
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                training.description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}